#!/bin/bash

# Atualiza o sistema
sudo apt-get update
sudo apt-get upgrade

# Instala o GCC, MakeFile, Git e Rust
sudo apt-get install -y gcc make git rustc

# Instala o VSCode
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo dpkg -i vscode.deb
rm vscode.deb

# Instala o Postman
sudo snap install postman

# Instala o IntelliJ IDEA
wget -O intellij.tar.gz https://download.jetbrains.com/idea/ideaIU-2021.3.3.tar.gz
sudo tar -xzf intellij.tar.gz -C /opt/
rm intellij.tar.gz

# Instala o Java JDK 19
sudo apt-get install -y openjdk-11-jdk

# Faz o download da imagem e define como papel de parede
wget -O wallpaper.jpg https://www.10wallpaper.com/wallpaper/1920x1080/1711/Calm_lake_in_the_evening_Scenery_HD_Wallpaper_1920x1080.jpg
gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/wallpaper.jpg

# Configura o tema escuro com detalhes em roxo do Ubuntu
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions
sudo apt-get install -y chrome-gnome-shell
wget -O dark-purple.tar.gz "https://github.com/rafiibrahim8/Gnome-Dark-Purple/archive/refs/tags/v2.2.tar.gz"
sudo tar -xzf dark-purple.tar.gz -C /usr/share/themes/
rm dark-purple.tar.gz
gsettings set org.gnome.desktop.interface gtk-theme "Gnome-Dark-Purple-2.2"

# Instala o Arduino IDE
sudo apt-get install -y arduino

echo "Instalação concluída."
