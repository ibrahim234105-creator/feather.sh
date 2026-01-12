#!/bin/bash

# ================= COLORS =================
R="\e[31m"
G="\e[32m"
Y="\e[33m"
C="\e[36m"
W="\e[37m"
N="\e[0m"

# ================= FUNCTIONS =================

print_divider() {
    echo -e "${C}==========================================================${N}"
}

print_status() {
    echo -e "${C}[$1]${N} $2"
}

print_jishnu_logo() {
echo -e "${C}"
cat << "EOF"
  _____           _   _               ____  _                
|  ___|__   __ _| |_| |__   ___ _ __|  _ \| | __ _ _   _ ____
| |_ / _ \ / _` | __| '_ \ / _ \ '__| |_) | |/ _` | | | |_  /
|  _|  __/| (_| | |_| | | |  __/ |  |  __/| | (_| | |_| |/ / 
|_|  \___| \__,_|\__|_| |_|\___|_|  |_|   |_|\__,_|\__, /___|
                Powered by FeatherPlayz            |___/     
EOF
echo -e "${N}"
}

# ================= MAIN =================

clear
print_jishnu_logo
echo

print_jishnu_logo
echo -e "${R}|${W}              IDX TOOL SETUP                          ${R}|${N}"
echo -e "${R}+----------------------------------------------------------+${N}\n"

echo -e "${Y}[*] Cleaning up old files...${N}"
cd ~ || exit
rm -rf myapp flutter

cd FREE-VPS || exit

if [ ! -d ".idx" ]; then
    echo -e "${G}[+] Creating .idx directory...${N}"
    mkdir .idx
    cd .idx || exit

    echo -e "${C}[*] Creating dev.nix configuration...${N}"
    echo -e "${Y}----------------------------------------------------------${N}"

cat <<EOF > dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    unzip
    openssh
    git
    qemu_kvm
    sudo
    cdrkit
    cloud-utils
    qemu
  ];

  env = {
    EDITOR = "nano";
  };

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      onCreate = { };
      onStart = { };
    };

    previews = {
      enable = false;
    };
  };
}
EOF

    echo -e "${Y}----------------------------------------------------------${N}"
    echo -e "\n${G}[OK] IDX TOOL SETUP COMPLETE!${N}"

    echo -e "${R}+----------------------------------------------------------+${N}"
    echo -e "${R}|${W} Status   : ${Y}Ready to use${W}                        ${R}|${N}"
    echo -e "${R}|${W} Location : ${Y}~/FREE-VPS/.idx${W}                       ${R}|${N}"
    echo -e "${R}|${W} Tool     : ${Y}IDX Development Environment${W}         ${R}|${N}"
    echo -e "${R}|${W} Version  : ${Y}Stable 24.50${W}                        ${R}|${N}"
    echo -e "${R}+----------------------------------------------------------+${N}"

else
    echo -e "${R}+----------------------------------------------------------+${N}"
    echo -e "${R}|${Y} [!] IDX Tool already setup - skipping.${W}             ${R}|${N}"
    echo -e "${R}|${W} Location : ${Y}~/FREE-VPS/.idx${W}                          ${R}|${N}"
    echo -e "${R}+----------------------------------------------------------+${N}"
fi

echo -e "\n${C}==========================================================${N}"
echo -ne "${C}>>${W} Press Enter to return to main menu...${N}"
read -r
