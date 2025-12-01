#!/usr/bin/bash
# TODO: cancel install on something failing

sudo dnf update
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable errornointernet/quickshell
sudo dnf copr enable atim/starship
sudo dnf copr enable alternateved/eza
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf copr enable alternateved/cliphist && \
sudo dnf install -y \
  @development-tools autoconf automake libtool pkgconf cmake ninja-build git make gcc-c++ \
  openssl-devel zlib-devel libstdc++-devel \
  qt6-qtbase-devel qt6-qtdeclarative-devel qt6-qtwayland-devel qt6-qtsvg-devel \
  qt6-qtshadertools-devel qt6-qttools-devel qt6-qtmultimedia-devel qt6-qt5compat-devel \
  qt6-qtquickcontrols2 qt6-qtquickcontrols2-devel \
  wayland-devel wayland-protocols-devel libxkbcommon-devel libxkbcommon-x11-devel \
  libdrm-devel mesa-libgbm-devel libxcb-devel mesa-libGL-devel mesa-libGLU-devel SDL2-devel \
  glib2-devel alsa-lib-devel ncurses-devel pulseaudio-libs-devel pam-devel polkit-devel \
  libqalculate-devel fftw-devel spirv-tools vulkan-headers vulkan-loader-devel \
  libnotify-devel scdoc iniparser iniparser-devel \
  pipewire-devel pipewire aubio-devel cli11-devel \
  flatpak fish python3-pip python3-devel pipx \
  grim wl-clipboard slurp glib2 cliphist fuzzel \
  ddcutil brightnessctl lm_sensors cava meson snapd hyprland hyprland-devel quickshell xdg-desktop-portal-hyprland \
  hyprpicker inotify-tools trash-cli fastfetch btop jq papirus-icon-theme starship adw-gtk3-theme install qt5ct qt6ct kvantum eza rofi \
  brave-browser
  
sudo ln -s /var/lib/snapd/snap /snap

git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
./setup.sh
cd ..

sudo mkdir -p /usr/local/share/fonts && \
sudo curl -L -o /usr/local/share/fonts/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip && \
sudo unzip -o /usr/local/share/fonts/JetBrainsMono.zip -d /usr/local/share/fonts && \
sudo rm /usr/local/share/fonts/JetBrainsMono.zip && \
sudo fc-cache -fv

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.dec05eba.gpu_screen_recorder

sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"
# Yes to axel in pacstall!

git clone https://github.com/Vladimir-csp/app2unit.git
cd app2unit
sudo make install

# test DNF first
sudo snap install dart-sass

# ensure pipx is in path for root
sudo pipx ensurepath

# Caelestia CLI requires the deps above^
git clone https://github.com/caelestia-dots/cli.git && cd cli

# TODO: Insert some sed command to set pyproject.toml
# min version to requires-python = ">=3.12"? might not need i cant remember lol

python3 -m venv .build-venv
.build-venv/bin/pip install --upgrade pip
.build-venv/bin/pip install build installer hatchling hatch-vcs
pip install -e .[all]
python -m build --wheel
sudo python3 -m installer dist/*.whl
sudo cp completions/caelestia.fish /usr/share/fish/vendor_completions.d/caelestia.fish

sudo sensors-detect --auto
git clone https://github.com/karlstav/cava.git ~/cava
cd ~/cava
./autogen.sh
./configure
make -j$(nproc)
sudo make install
cd ~
rm -rf ~/cava
wget -O zig.tar.xz https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
tar xf zig.tar.xz
export PATH="$PWD/zig-linux-x86_64-0.13.0:$PATH"
git clone --recursive https://git.outfoxxed.me/quickshell/quickshell.git ~/quickshell
cd ~/quickshell
cmake -GNinja -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build -j$(nproc)
sudo cmake --install build
cd ~
rm -rf ~/quickshell zig.tar.xz zig-linux-x86_64-0.13.0
mkdir -p ~/.local/share/fonts
wget -O CaskaydiaCove.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
unzip CaskaydiaCove.zip '*.ttf' -d ~/.local/share/fonts/
rm CaskaydiaCove.zip
wget -O MaterialSymbols.zip https://github.com/google/material-design-icons/releases/download/4.0.0/material-symbols.zip
unzip MaterialSymbols.zip 'materialsymbolsrounded/*.ttf' -d ~/.local/share/fonts/
rm -rf MaterialSymbols.zip materialsymbolsrounded
fc-cache -fv

git clone https://github.com/LukashonakV/cava.git ~/libcava
cd ~/libcava
meson setup build --prefix=/usr/local
meson compile -C build
sudo meson install -C build
sudo ldconfig # Registers libcava.so
rm libcava

git clone https://github.com/caelestia-dots/shell.git caelestia

cd caelestia
cmake -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$HOME/.local
cmake --build build

cd
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd
