# Dotfiles

Shell and development setup for macOS and Fedora, managed with [chezmoi](https://www.chezmoi.io/).

## Install

Requires internet access and `sudo`.

### macOS

Install Xcode tools and Homebrew, then follow Homebrew's instructions to add it to `PATH`:

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install chezmoi
chezmoi init --apply https://github.com/qngdt/dotfiles.git
```

Includes Ghostty and the Colima/Docker toolchain.

### Fedora

```sh
sudo dnf install -y chezmoi git
chezmoi init --apply https://github.com/qngdt/dotfiles.git
```

Uses Podman for Docker-compatible commands. Ghostty requires separate installation.

After logging out and back in, add **Unikey** (Telex) and **Mozc** in **Fcitx 5 Configuration** for Vietnamese and Japanese input.

WebHID setup grants the active local user and their applications access to all current and future raw HID devices. Browser configurators still require website permission.

### Set the shell

On either platform, run this and start a new login session:

```sh
zsh_path="$(command -v zsh)"
grep -qxF "$zsh_path" /etc/shells || printf '%s\n' "$zsh_path" | sudo tee -a /etc/shells
chsh -s "$zsh_path"
```

## Maintain

```sh
chezmoi update  # Pull and apply upstream changes
chezmoi cd      # Open the source directory
chezmoi diff    # Preview pending changes
chezmoi apply   # Apply local changes
```

| Configuration | Source |
| --- | --- |
| System packages | `.chezmoidata/packages.yaml` |
| Developer tools | `dot_config/mise/config.toml` |
| Project runtimes | Each project's `mise.toml` |
| Antidote and tmux checkout | `.chezmoiexternal.toml` |
| Zsh plugins | `dot_zsh_plugins.txt` |
| Linux HID permissions | `.chezmoiscripts/run_onchange_after_configure-webhid.sh.tmpl` |

Setup scripts rerun when their rendered contents change. Run `chezmoi apply` after editing configuration.
