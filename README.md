# Dotfiles

Personal shell and development environment managed by
[chezmoi](https://www.chezmoi.io/). The same configuration supports macOS and
Fedora Linux; package installation is selected automatically for each platform.

## Fresh machine

The repository is public, so the initial checkout does not require GitHub SSH
keys. An internet connection and `sudo` access are required.

### macOS

1. Install the Xcode command-line tools and Homebrew:

   ```sh
   xcode-select --install
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Follow Homebrew's printed instructions to add `brew` to `PATH`, then install
   chezmoi and apply the dotfiles:

   ```sh
   brew install chezmoi
   chezmoi init --apply https://github.com/qngdt/dotfiles.git
   ```

Homebrew then installs the macOS package set, including Ghostty and the
Colima/Docker toolchain.

### Fedora Linux

Install the bootstrap dependencies and apply the repository:

```sh
sudo dnf install -y chezmoi git
chezmoi init --apply https://github.com/qngdt/dotfiles.git
```

During `apply`, chezmoi will ask for sudo access and install the Fedora package
set. Podman supplies the Docker-compatible CLI; no Colima VM is needed. Ghostty
is intentionally not installed on Fedora yet. Vietnamese Telex input is
provided by Fcitx5 Unikey. After applying, log out and back in, open **Fcitx 5
Configuration**, add **Unikey** to the active input methods, and select **Telex**
in its settings if it is not already selected.

After installation, make Zsh the login shell and start a new login session:

```sh
zsh_path="$(command -v zsh)"
grep -qxF "$zsh_path" /etc/shells || printf '%s\n' "$zsh_path" | sudo tee -a /etc/shells
chsh -s "$zsh_path"
```

The first Zsh startup downloads the configured Antidote plugins. `mise` installs
the cross-platform developer tools declared in `~/.config/mise/config.toml`.
Language runtimes belong in each project's `mise.toml`.

## Day-to-day use

Pull the latest repository changes and apply them with:

```sh
chezmoi update
```

Preview local changes before applying:

```sh
chezmoi diff
chezmoi apply
```

Edit the managed source repository with:

```sh
chezmoi cd
```

Package installation uses a templated `run_onchange_` script, so it only runs
again when the package declarations or mise tool configuration changes.

## Package ownership

- macOS and Fedora system packages: `.chezmoidata/packages.yaml`
- Portable developer tools: `dot_config/mise/config.toml`
- Project language runtimes: the project's `mise.toml`
- Zsh plugins: `dot_zsh_plugins.txt`

After changing a package declaration, run `chezmoi apply`.
