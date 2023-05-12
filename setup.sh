#!/bin/bash

# Atualizar o sistema
sudo apt-get update
sudo apt-get upgrade

# Instalar o git
sudo apt-get install git

# Configura o git
git config —global user.email {seu email git}

# Faz o download da imagem e define como papel de parede
wget -O wallpaper.jpg https://www.10wallpaper.com/wallpaper/1920x1080/1711/Calm_lake_in_the_evening_Scenery_HD_Wallpaper_1920x1080.jpg
gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/wallpaper.jpg

# Instalar Java JDK
sudo apt-get install default-jdk

# Instalar compilador C e C++ (GCC)
sudo apt-get install gcc g++

# Instalar Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Instalar Maven
sudo apt-get update
sudo apt-get install maven

# Instalar PostgreSQL e PGAdmin
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get install postgresql postgresql-contrib pgadmin4

# Configurar PostgreSQL para usar UTF-8
sudo sed -i "s/#\s*\(.*UTF-8\)/\1/" /etc/locale.gen
sudo locale-gen
sudo update-locale LANG=en_US.UTF-8
sudo service postgresql restart

# Configurar o PostgreSQL
sudo -u postgres psql -c "alter user postgres with password 'postgres';"
sudo -u postgres createdb -O postgres mydb


# Instala o PGAdmin 4
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-desktop

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

# Instala o Postman
sudo snap install postman

# Instala o Arduino IDE
sudo apt-get install -y arduino

# Instala o SHH termius
sudo snap install termius-app

# Instala o Gradle
mkdir /opt/gradle
wget https://services.gradle.org/distributions/gradle-8.1.1-bin.zip -P /opt/gradle/
unzip -d /opt/gradle gradle-8.1.1-bin.zip
ls /opt/gradle/gradle-8.1.1

# Instala o balena etcher
wget https://github.com/balena-io/etcher/releases/download/v1.18.4/balenaEtcher-1.18.4-x64.AppImage

# Setserial installation
sudo apt install setserial

echo "Configuração concluída!"
