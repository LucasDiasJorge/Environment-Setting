#!/bin/bash

# Atualizar o sistema
sudo apt-get update
sudo apt-get upgrade

# Instalar pacotes essenciais
sudo apt-get install build-essential git wget curl vim

# Faz o download da imagem e define como papel de parede
wget -O wallpaper.jpg https://www.10wallpaper.com/wallpaper/1920x1080/1711/Calm_lake_in_the_evening_Scenery_HD_Wallpaper_1920x1080.jpg
gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/wallpaper.jpg

# Instalar Java JDK
sudo apt-get install default-jdk

# Instalar PostgreSQL e PGAdmin
sudo apt-get install postgresql postgresql-contrib pgadmin4

# Configurar PostgreSQL para usar UTF-8
sudo sed -i "s/#\s*\(.*UTF-8\)/\1/" /etc/locale.gen
sudo locale-gen
sudo update-locale LANG=en_US.UTF-8
sudo service postgresql restart

# Instalar compilador C e C++ (GCC)
sudo apt-get install gcc g++

# Instalar Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Instalar o ambiente de desenvolvimento integrado (IDE) IntelliJ
wget https://download-cf.jetbrains.com/idea/ideaIC-2021.3.3.tar.gz
tar -xvzf ideaIC-2021.3.3.tar.gz
sudo mv idea-IC-* /opt/
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=IntelliJ IDEA\nComment=IntelliJ IDEA\nExec=/opt/idea-IC-*/bin/idea.sh\nIcon=/opt/idea-IC-*/bin/idea.png\nTerminal=false\nType=Application\nCategories=GNOME;Application;Development;" > ~/.local/share/applications/intellij.desktop
chmod +x ~/.local/share/applications/intellij.desktop

# Instalar o VS Code
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./code_*_amd64.deb
rm code_*_amd64.deb

echo "Configurando VS Code extensions"
# Instalar as extensões do VS Code
code --install-extension redhat.java
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension vscode-icons-team.vscode-icons
code --install-extension tht13.python
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension ms-python.vscode-pylance
code --install-extension rust-lang.rust

# Configurar o PostgreSQL
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
sudo -u postgres createdb -O postgres mydb

# Instala o Postman
sudo snap install postman

# Instala o Arduino IDE
sudo apt-get install -y arduino

echo "Configuração concluída!"
