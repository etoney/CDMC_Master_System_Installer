# CDMC_master_system_installer

One installer for the Castle Danger Music Company **Mix System**: The Master, The Servant, The Freak, Chop Shop,
Dominatrix, BuzzKill, Flatliner and Low Blow.

- **macOS**: `CDMC_master_system_installer-macOS.pkg` (branch `downloads-macos`). Plug-ins to `/Library/Audio/Plug-Ins`,
  apps and guides to `/Applications/Castle Danger Music Company`. Clears the quarantine flag on what it installs, moves
  older hand-installed copies out of `~/Library/Audio/Plug-Ins`, resets the AU cache. No Terminal needed; unsigned for now,
  so the first open needs **System Settings > Privacy & Security > Open Anyway**.
- **Windows**: `CDMC_master_system_installer-Windows.exe` (branch `downloads-windows`), Inno Setup. VST3 to
  `C:\Program Files\Common Files\VST3`, apps and guides to `C:\Program Files\Castle Danger Music Company`.

CI (`.github/workflows/build.yml`) downloads the newest zip of each plugin from its own repo's download branch
(`plugins.txt` lists them), builds both installers, **installs them on the CI Mac and PC to check every plugin lands**, and
publishes them. Re-run it from the Actions tab whenever a plugin has a new version.

`INSTALL.txt` is the user-facing install guide (also installed into the Guides folder).
