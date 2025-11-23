# caelestia

This is a fork of the caelestia dots for FEDORA and contains my personal user configs for
apps/caelestia. This repo also includes an install script to install the entire dots for fedora and possibly
debian based systems in the future. This is not meant for anyone other than me, really.

This comes with some extra build from source stuff that caelestia doesn't have normally 
due to it not being for arch-based distros.

## Installation

Simply clone this repo and run the install script.

> [!WARNING]
> The install script symlinks all configs into place, so you CANNOT
> move/remove the repo folder once you run the install script. If
> you do, most apps will not behave properly and some (e.g. Hyprland)
> will fail to start completely. I recommend cloning the repo to
> `~/.local/share/caelestia`.

The install script has some options for installing configs for some apps.

```
$ ./install.fish -h
usage: ./install.sh [-h] [--noconfirm] [--spotify] [--vscode] [--discord]

options:
  -h, --help                  show this help message and exit
  --noconfirm                 do not confirm package installation
  --spotify                   install Spotify (Spicetify)
  --vscode=[codium|code]      install VSCodium (or VSCode)
  --discord                   install Discord (OpenAsar + Equicord)
```

For example:

```sh
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish
```

### Manual installation

Dependencies:

-   hyprland
-   xdg-desktop-portal-hyprland
-   xdg-desktop-portal-gtk
-   hyprpicker
-   wl-clipboard
-   cliphist
-   inotify-tools
-   app2unit
-   wireplumber
-   trash-cli
-   kitty
-   fish
-   fastfetch
-   starship
-   btop
-   jq
-   eza
-   adw-gtk-theme
-   papirus-icon-theme
-   qt5ct-kde
-   qt6ct-kde
-   ttf-jetbrains-mono-nerd

Install all dependencies and follow the installation guides of the
[shell](https://github.com/caelestia-dots/shell) and [cli](https://github.com/caelestia-dots/cli)
to install them.

Then copy or symlink the `hypr`, `kitty`, `fish`, `fastfetch`, `uwsm` and `btop` folders to the
`$XDG_CONFIG_HOME` (usually `~/.config`) directory. e.g. `hypr -> ~/.config/hypr`.
Copy `starship.toml` to `$XDG_CONFIG_HOME/starship.toml`.

#### Installing Spicetify configs:

Follow the Spicetify [installation instructions](https://spicetify.app/docs/advanced-usage/installation),
copy or symlink the `spicetify` folder to `$XDG_CONFIG_HOME/spicetify` and run

```sh
spicetify config current_theme caelestia color_scheme caelestia custom_apps marketplace
spicetify apply
```

#### Installing VSCode/VSCodium configs:

Install VSCode or VSCodium, then copy or symlink `vscode/settings.json` and
`vscode/keybindings.json` into the `$XDG_CONFIG_HOME/Code/User` (or `$XDG_CONFIG_HOME/VSCodium/User`
if using VSCodium) folder. Then copy or symlink `vscode/flags.conf` to `$XDG_CONFIG_HOME/code-flags.conf`
(or `$XDG_CONFIG_HOME/codium-flags.conf` if using VSCodium).

Finally, install the extension VSIX from `vscode/caelestia-vscode-integration`.

```sh
# Use `codium` if using VSCodium
code --install-extension vscode/caelestia-vscode-integration/caelestia-vscode-integration-*.vsix
```

## Updating

Update fedora using dnf, then `cd` into the repo directory and run `git pull` to update the configs.

## Usage

There aren't really any usage instructions... these are a set of dotfiles.

Here's a list of useful keybinds though:

-   `Super` - open launcher
-   `Super` + `#` - switch to workspace `#`
-   `Super` `Shift` + `#` - move window to workspace `#`
-   `Super` + `E` - open terminal (foot)
-   `Super` + `A` - open browser (zen)
-   `Super` + `S` - toggle special workspace or close current special workspace
-   `Ctrl` `Alt` + `Delete` - open session menu
-   `Ctrl` `Super` + `Space` - toggle media play state
-   `Ctrl` `Super` `Alt` + `R` - restart the shell
