#!/bin/bash

# Função para instalar um pacote com verificação de erros
install_package() {
    package_name="$1"
    if ! sudo dnf install -y "$package_name"; then
        echo "Falha ao instalar $package_name"
        exit 1
    fi
}

# Adicionar repositório do OpenJDK e instalar
install_package "java-20-openjdk-devel"

# Instalar IntelliJ Ultimate
wget -O idea.tar.gz https://download.jetbrains.com/idea/ideaIU-2023.1.1.tar.gz
tar -xzf idea.tar.gz
sudo mv idea-IU-212.5080.55 /opt/idea

# Instalar PostgreSQL
install_package "postgresql-server postgresql-contrib"
sudo postgresql-setup --initdb
sudo systemctl enable --now postgresql
sudo systemctl start postgresql

# Instalar pgAdmin 4
install_package "pgadmin4"

# Instalar GitHub Desktop
install_package "git"
wget -O github-desktop.rpm https://github.com/shiftkey/desktop/releases/download/release-2.9.4-linux1/GitHubDesktop-linux-2.9.4-linux1.rpm
sudo rpm -i github-desktop.rpm

# Instalar Insomnia
echo "deb [trusted=yes] https://download.opensuse.org/repositories/home:/jecisc/Debian_10/ /" | sudo tee /etc/apt/sources.list.d/insomnia.list
sudo apt update
install_package "insomnia"

# Instalar MySQL
install_package "mysql-server"
sudo systemctl enable --now mysqld
sudo systemctl start mysqld

# Instalar Maven
install_package "maven"

# Instalar Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
install_package "code"

# Instalar Snap
install_package "snapd"
sudo ln -s /var/lib/snapd/snap /snap

# Instalar Gradle
sudo snap install gradle --classic

# Instalar PGAdmin
install_package "pgadmin4-desktop"

# Instalar Lib Curl para C
install_package "libcurl-devel"

# Instalar AnyDesk
install_package "anydesk"

# Instalar BalenaEtcher
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.rpm.sh' | sudo -E bash
sudo dnf install -s balena-etcher-electron

# Instalar Termius
sudo snap install termius-app

echo "Instalação concluída com sucesso!"
