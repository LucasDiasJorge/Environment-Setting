#!/bin/bash

# Verifica se o script está sendo executado com privilégios de root
if [[ $EUID -ne 0 ]]; then
    echo "Este script precisa ser executado com privilégios de root. Por favor, execute-o como root ou utilize o comando 'sudo'."
    exit 1
fi

# Atualiza o sistema
apt-get update
apt-get upgrade -y

# Instala o git
apt-get install -y git

# Configura o git
git config --global user.email {seu email git}

# Faz o download da imagem e define como papel de parede
wget -O wallpaper.jpg https://www.10wallpaper.com/wallpaper/1920x1080/1711/Calm_lake_in_the_evening_Scenery_HD_Wallpaper_1920x1080.jpg
gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/wallpaper.jpg

# Instala o Java JDK
apt-get install -y default-jdk

# Instala o compilador C e C++ (GCC)
apt-get install -y gcc g++

# Instala o Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Instala o Maven
apt-get install -y maven

# Instala o PostgreSQL e o PGAdmin
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
apt-get update
apt-get install -y postgresql postgresql-contrib pgadmin4

# Configura o PostgreSQL para usar UTF-8
sed -i "s/#\s*\(.*UTF-8\)/\1/" /etc/locale.gen
locale-gen
update-locale LANG=en_US.UTF-8
service postgresql restart

# Configura o PostgreSQL
sudo -u postgres psql -c "alter user postgres with password 'postgres';"
sudo -u postgres createdb -O postgres mydb

# Instala o PGAdmin 4
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list
apt-get update
apt-get install -y pgadmin4-desktop

# Instala o MySQL Server
apt-get install -y mysql-server

# Inicia o serviço do MySQL
service mysql start

# Instala o ambiente de desenvolvimento integrado (IDE) IntelliJ
wget https://download-cf.jetbrains.com/idea/ideaIC-2021.3.3.tar.gz
tar -xvzf ideaIC-2021.3.3.tar.gz
mv idea-IC-* /opt/
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=IntelliJ IDEA\nComment=IntelliJ IDEA\nExec=/opt/idea-IC-*/bin/idea.sh\nIcon=/opt/idea-IC-*/bin/idea.png\nTerminal=false\nType=Application\nCategories=GNOME;Application;Development;" > ~/.local/share/applications/intellij.desktop
chmod +x ~/.local/share/applications/intellij.desktop

# Instala o VS Code
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
apt install -y ./code.deb
rm code.deb

echo "Configurando extensões do VS Code"
# Instala as extensões do VS Code
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
snap install postman

# Instala o Arduino IDE
apt-get install -y arduino

# Instala o SSH Termius
snap install termius-app

# Instala o Gradle
mkdir /opt/gradle
wget https://services.gradle.org/distributions/gradle-8.1.1-bin.zip -P /opt/gradle/
unzip -d /opt/gradle /opt/gradle/gradle-8.1.1-bin.zip
ls /opt/gradle/gradle-8.1.1

# Instala o balenaEtcher
wget https://github.com/balena-io/etcher/releases/download/v1.18.4/balenaEtcher-1.18.4-x64.AppImage

# Instala o Setserial
apt-get install -y setserial

echo "Configuração concluída!"
