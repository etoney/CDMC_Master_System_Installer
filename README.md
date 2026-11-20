# CDMC_master_system_installer

One installer for the Castle Danger Music Company **Mix System**: The Master, The Servant, The Freak, Cutthroat,
Dominatrix, Dead Air, Flatliner and Low Blow.

- **macOS**: `CDMC_master_system_installer-macOS.pkg` (branch `downloads-macos`). Plug-ins to `/Library/Audio/Plug-Ins`,
  guides to `/Applications/Castle Danger Music Company/Guides`. Clears the quarantine flag on what it installs and
  resets the AU cache. No Terminal needed; unsigned for now,
  so the first open needs **System Settings > Privacy & Security > Open Anyway**.
- **Windows**: `CDMC_master_system_installer-Windows.exe` (branch `downloads-windows`), Inno Setup. VST3 to
  `C:\Program Files\Common Files\VST3`, guides to `C:\Program Files\Castle Danger Music Company\Guides`.

CI (`.github/workflows/build.yml`) downloads the newest zip of each plugin from its own repo's download branch
(`plugins.txt` lists them), builds both installers, **installs them on the CI Mac and PC to check every plugin lands**, and
publishes them. Re-run it from the Actions tab whenever a plugin has a new version.

`docs/Mix System User Guide.pdf` is the user guide: it ships next to the installer in each zip and is installed into the Guides folder.

Every package version is kept: the version is the build date (`YYYY.MM.DD`, `.2` for a second build that day), the zips are named `CDMC_master_system_installer-v<version>-<macOS|Windows>.zip`, and each version gets a GitHub release.
