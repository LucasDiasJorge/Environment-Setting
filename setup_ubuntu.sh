#!/bin/bash

# Atualizar repositórios
sudo apt update

# Instalar o Git
sudo apt install git -y

# Instalar o Java JDK 8
sudo apt install openjdk-8-jdk -y

# Instalar o Java JDK 11
sudo apt install openjdk-11-jdk -y

# Instalar o Java JDK 18
sudo apt install openjdk-18-jdk -y

# Instalar o Java JDK 20
sudo apt install openjdk-20-jdk -y

# Instalar o Java JDK 21
sudo apt install openjdk-21-jdk -y

# Instalar o Maven
sudo apt install maven -y

# Instalar o PostgreSQL
sudo apt install postgresql -y

# Instalar o pgAdmin 4
sudo apt install pgadmin4 -y

# Configurar o usuário "postgres" com senha "postgres"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# Instalar o MySQL Server
sudo apt install mysql-server -y

# Instalar o Visual Studio Code
sudo apt install code -y

# Instalar o Insomnia
sudo snap install insomnia

# Instalar o Gradle
sudo apt install gradle -y

# Instalar o Arduino IDE
sudo apt install arduino -y

# Instalar o AnyDesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor -o /usr/share/keyrings/anydesk-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/anydesk-keyring.gpg] https://keys.anydesk.com/repos/Debian stable main" | sudo tee /etc/apt/sources.list.d/anydesk.list
sudo apt update
sudo apt install anydesk -y

# Instalar o Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code -y

# Fim da instalação
echo "Instalação concluída!"
