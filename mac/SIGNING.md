# Signing and notarizing the Mac installer

The build already signs and notarizes the Mac installer. It only needs six secrets in this repo's
**Settings > Secrets and variables > Actions**. Until they're there, the Sign and Notarize steps are skipped and the
`.pkg` ships unsigned.

| Secret | What it holds |
|---|---|
| `MACOS_CERT_APP_P12` | base64 of your **Developer ID Application** certificate and its private key (.p12). Signs every `.vst3` and `.component`. |
| `MACOS_CERT_INSTALLER_P12` | base64 of your **Developer ID Installer** certificate and its private key (.p12). Signs the `.pkg`. |
| `MACOS_CERT_PASSWORD` | the password you exported both .p12 files with |
| `NOTARY_KEY_P8` | base64 of an App Store Connect API key (.p8), used to notarize |
| `NOTARY_KEY_ID` | that key's Key ID |
| `NOTARY_ISSUER_ID` | your team's Issuer ID (shown above the key list) |

Notarization uses an App Store Connect API key, not an Apple ID app-specific password, because a CI Mac can't answer
two-factor prompts and a key can be revoked on its own. Nothing secret is ever written to the repo: `sign.sh` loads the
certificates into a throwaway keychain on the CI Mac, and `notarize.sh` deletes the key file when it's done.

## One-time setup on your Mac

You need to be the Account Holder of the Apple Developer team to create Developer ID certificates.

### 1. Make a certificate signing request

1. Open **Keychain Access**, then **Keychain Access > Certificate Assistant > Request a Certificate From a Certificate Authority**.
2. Enter your email and **Castle Danger Music Company** as the common name, leave the CA email empty, pick **Saved to disk**, and save `CertificateSigningRequest.certSigningRequest`.

### 2. Create the two certificates

1. Go to developer.apple.com > Account > **Certificates, Identifiers & Profiles > Certificates**, click **+**.
2. Under **Software**, pick **Developer ID**, then **Developer ID Application** (choose the G2 Sub-CA if asked). Upload the request from step 1, download the `.cer`, double-click it to add it to your login keychain.
3. Make a second request the same way (step 1, saved under another name), click **+** again and do the same for **Developer ID Installer** with it.
4. Check both landed with their keys:

   ```sh
   security find-identity -v -p codesigning | grep "Developer ID Application"
   security find-identity -v | grep "Developer ID Installer"
   ```

   Each should print a line ending in `"Developer ID ... : <Your Name> (TEAMID)"`. The 10-character code in brackets is your Team ID.

### 3. Export them as .p12

In Keychain Access, open **login > My Certificates**. For each certificate, click the arrow to show its private key,
select the certificate and its key together, choose **File > Export Items**, save as `.p12`, and set a password. Use the
same password for both. Save them as `devid-app.p12` and `devid-installer.p12`.

### 4. Make the notarization key

1. Go to App Store Connect > **Users and Access > Integrations > App Store Connect API > Team Keys** and click **+** (request access first if it asks).
2. Name it `CDMC notarization`, give it the **Developer** role, and generate it.
3. Download the `.p8` right away: Apple only lets you download it once. Note the **Key ID** on its row and the **Issuer ID** above the list.

### 5. Add the secrets

With the GitHub CLI, from any folder (it copies each value straight from the file, so nothing goes through your clipboard):

```sh
R=etoney/CDMC_Master_System_Installer
base64 -i devid-app.p12       | gh secret set MACOS_CERT_APP_P12 -R $R
base64 -i devid-installer.p12 | gh secret set MACOS_CERT_INSTALLER_P12 -R $R
gh secret set MACOS_CERT_PASSWORD -R $R          # type the .p12 password when asked
base64 -i AuthKey_XXXXXXXXXX.p8 | gh secret set NOTARY_KEY_P8 -R $R
gh secret set NOTARY_KEY_ID -R $R                # paste the Key ID
gh secret set NOTARY_ISSUER_ID -R $R             # paste the Issuer ID
```

Or paste each value in by hand under **Settings > Secrets and variables > Actions > New repository secret**
(`base64 -i devid-app.p12 | pbcopy` puts one on the clipboard).

Then keep the `.p12` files and the `.p8` somewhere safe outside the repo (a password manager is ideal) and delete the loose copies.

## Building a signed installer

Run **Build the Mix System installers** from the Actions tab. In the macOS job:

- **Sign the plug-ins** lists `signed <Plugin>.vst3` / `.component` for every plugin.
- **Build the .pkg** ends with `pkgutil --check-signature` showing `Developer ID Installer: ...`.
- **Notarize and staple** shows `notary: Accepted`, then `source=Notarized Developer ID`. If Apple rejects it, the step prints Apple's log, which names each file that failed and why.
- **Test-install it on this Mac** checks every installed plugin still has a valid Developer ID signature.

## Checking a downloaded installer

On your Mac, after downloading the zip from the site:

```sh
pkgutil --check-signature CDMC_master_system_installer-macOS.pkg   # Status: signed by a developer certificate issued by Apple for distribution
spctl --assess --type install -vv CDMC_master_system_installer-macOS.pkg   # accepted, source=Notarized Developer ID
xcrun stapler validate CDMC_master_system_installer-macOS.pkg      # The validate action worked!
```

Double-click it: it should open straight into the installer with no Privacy & Security step. After installing:

```sh
cd /Library/Audio/Plug-Ins/VST3 && ls          # find The Master's .vst3, then:
codesign -dv --verbose=2 "<its name>.vst3" 2>&1 | grep -E "Authority=Developer ID|flags"
```

It should show `flags=0x10000(runtime)` and `Authority=Developer ID Application: ...`.

Once that all checks out, the "isn't signed by Apple yet" Mac line can come out of the user guide.

## When a certificate expires

Developer ID certificates last five years. Make new ones (steps 1 to 3) and update the two `.p12` secrets and the
password. Installers signed with the old certificate keep working because they carry a secure timestamp.
