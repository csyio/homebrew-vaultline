# homebrew-vaultline

[![Cask denetimi](https://github.com/csyio/homebrew-vaultline/actions/workflows/audit.yml/badge.svg)](https://github.com/csyio/homebrew-vaultline/actions/workflows/audit.yml)
[![Licence](https://img.shields.io/badge/licence-BSD--2--Clause-informational)](LICENSE)

Homebrew tap for [Vaultline](https://github.com/csyio/vaultline-app) — a local,
zero-knowledge desktop password manager for macOS.

[Türkçe](README.md) · **English**

## Install

```sh
brew tap csyio/vaultline
brew install --cask vaultline
```

On first install, Homebrew asks for explicit approval before installing a cask
from an unofficial tap (a Homebrew 6.0+ security feature). If prompted, run:

```sh
brew trust --cask csyio/vaultline/vaultline
```

and repeat the install. This states that you trust the tap's cask definition
(its download URL and SHA256 verification).

## Update

```sh
brew upgrade --cask vaultline
```

## Uninstall

Removes the application only, leaving settings behind:

```sh
brew uninstall --cask vaultline
```

Removes application data as well:

```sh
brew uninstall --zap --cask vaultline
```

`--zap` deletes these folders:

```
~/Library/Application Support/com.csyio.vaultline
~/Library/Caches/com.csyio.vaultline
~/Library/HTTPStorages/com.csyio.vaultline
~/Library/Preferences/com.csyio.vaultline.plist
~/Library/Saved Application State/com.csyio.vaultline.savedState
~/Library/WebKit/com.csyio.vaultline
```

> ### ⚠️ Your vault file is not deleted
>
> **No uninstall command** — `--zap` included — touches your vault file
> (`.vault`) or your backups (`.vaultbak`). They stay wherever you put them,
> and they are your data.
>
> This is deliberate: it would be unacceptable for an uninstall command to
> delete all of your passwords. If you want the vault gone too, you have to
> delete the file **yourself**. If you can't remember where it is:
>
> ```sh
> mdfind -name '.vault' | grep -i vault
> ```
>
> The vault file is encrypted, but before deleting make sure you haven't
> forgotten your master password and no longer need what's inside. **There is
> no undo.**

## How this tap is verified

The cask is not maintained by hand alone. Two workflows guard it:

| Workflow | What it does |
| :-- | :-- |
| [`audit.yml`](.github/workflows/audit.yml) | Runs `brew style` and `brew audit --online --strict` on every change and once a week. It also checks that the cask's `sha256` matches the `SHA256SUMS.txt` published with the release — a cask can break without anyone touching it, and we would rather find out before a user does. |
| [`bump.yml`](.github/workflows/bump.yml) | Raises the cask to a new version. The digest is read from the release's own `SHA256SUMS.txt` and re-checked against the actually downloaded package — never typed in by hand. |

The package is signed with an Apple Developer ID and notarized by Apple. The
`sha256` in the cask is identical to the one in
[the release's](https://github.com/csyio/vaultline-app/releases/latest)
`SHA256SUMS.txt`.

## Reporting a problem

- A problem with **this tap** (installation, uninstall, cask definition) →
  [open an issue here](https://github.com/csyio/homebrew-vaultline/issues)
- A problem with **the application itself** →
  [vaultline-app issues](https://github.com/csyio/vaultline-app/issues)
- A **security vulnerability** → do not open an issue; see
  [SECURITY.md](SECURITY.md)

## Licence

[BSD 2-Clause](LICENSE) — the same licence as Homebrew itself. This covers only
this repository's contents (the cask definition, documentation, workflows).

The Vaultline application that the cask installs is subject to
[separate terms](https://github.com/csyio/vaultline-app/blob/main/LICENSE).
