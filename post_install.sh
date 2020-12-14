#!bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "O script precisa ser executado como root."
    exit 1
else
    echo "Iniciando instalação de programas..."
    apt-get update && sudo apt-get upgrade -y

    sudo apt install software-properties-common apt-transport-https wget

    # Install git programs
    apt-get install git-all git-flow curl
    
    # Install VSCode
    wget -q https://packages.microsoft.com/keys/microsoft.asc -0- | sudo apt-key add --
    sudo add-apt-repository “deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
    apt install code

    # Install DBeaver
    sudo add-apt-repository ppa:serge-rider/dbeaver-code
    sudo apt-get update
    sudo apt-get install dbeaver-ce

    # Install Spotify
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    apt-get update && apt-get install spotify-client

    # Install LAMP
    apt-get install apache2
    apt install php libapache2-mod-php php-mysql
    ufw app list
    ufw app info "Apache Full"