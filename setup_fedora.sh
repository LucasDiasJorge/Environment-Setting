#!/bin/bash

# Adicionar repositório do OpenJDK
sudo dnf install java-20-openjdk-devel

# Instalar IntelliJ Ultimate
wget -O idea.tar.gz https://download.jetbrains.com/idea/ideaIU-2023.1.1.tar.gz
tar -xzf idea.tar.gz
sudo mv idea-IU-212.5080.55 /opt/idea

# Instalar Snap
sudo dnf install snapd

# Instalar PostgreSQL
sudo dnf install postgresql-server postgresql-contrib
sudo postgresql-setup --initdb
sudo systemctl enable --now postgresql
sudo systemctl start postgresql

# Instalar pgAdmin 4
sudo dnf install pgadmin4

# Instalar GitHub Desktop
sudo dnf install git
wget -O github-desktop.rpm https://github.com/shiftkey/desktop/releases/download/release-2.9.4-linux1/GitHubDesktop-linux-2.9.4-linux1.rpm
sudo rpm -i github-desktop.rpm

# Instalar Insomnia
echo "deb [trusted=yes] https://download.opensuse.org/repositories/home:/jecisc/Debian_10/ /" | sudo tee /etc/apt/sources.list.d/insomnia.list
sudo apt update
sudo apt install insomnia

# Instalar MySQL
sudo dnf install mysql-server
sudo systemctl enable --now mysqld
sudo systemctl start mysqld

# Instalar Maven
sudo dnf install maven

# Instalar Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf install code

# Instalar whiteboard
flatpak install flathub ch.openboard.OpenBoard

# Instalar Snap
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap

# Instalar Gradle
sudo snap install gradle --classic

# Instalar PGAdmin
sudo yum install pgadmin4-desktop

# Instalar Lib Curl para C
sudo dnf install libcurl-devel

# Instalar AnyDesk
dnf install anydesk

# Instalar BalenaEtcher
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
curl -1sLf \
'https://dl.cloudsmith.io/public/balena/etcher/setup.rpm.sh' \
| sudo -E bash
sudo dnf install -s balena-etcher-electron

echo "Instalação concluída com sucesso!"
