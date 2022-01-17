#!/bin/bash
echo " ██▀███   ██▓ ▄████▄   ▄▄▄       ██▀███  ▓█████▄  ▒█████       ▄████  ▒█████   ███▄ ▄███▓▓█████ ▒███████▒
▓██ ▒ ██▒▓██▒▒██▀ ▀█  ▒████▄    ▓██ ▒ ██▒▒██▀ ██▌▒██▒  ██▒    ██▒ ▀█▒▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀ ▒ ▒ ▒ ▄▀░
▓██ ░▄█ ▒▒██▒▒▓█    ▄ ▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌▒██░  ██▒   ▒██░▄▄▄░▒██░  ██▒▓██    ▓██░▒███   ░ ▒ ▄▀▒░ 
▒██▀▀█▄  ░██░▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌▒██   ██░   ░▓█  ██▓▒██   ██░▒██    ▒██ ▒▓█  ▄   ▄▀▒   ░
░██▓ ▒██▒░██░▒ ▓███▀ ░ ▓█   ▓██▒░██▓ ▒██▒░▒████▓ ░ ████▓▒░   ░▒▓███▀▒░ ████▓▒░▒██▒   ░██▒░▒████▒▒███████▒
░ ▒▓ ░▒▓░░▓  ░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ░ ▒░▒░▒░     ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░░▒▒ ▓░▒░▒
  ░▒ ░ ▒░ ▒ ░  ░  ▒     ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒   ░ ▒ ▒░      ░   ░   ░ ▒ ▒░ ░  ░      ░ ░ ░  ░░░▒ ▒ ░ ▒
  ░░   ░  ▒ ░░          ░   ▒     ░░   ░  ░ ░  ░ ░ ░ ░ ▒     ░ ░   ░ ░ ░ ░ ▒  ░      ░      ░   ░ ░ ░ ░ ░
   ░      ░  ░ ░            ░  ░   ░        ░        ░ ░           ░     ░ ░         ░      ░  ░  ░ ░    
             ░                            ░                                                     ░       "
echo "Checando si los paquetes necesarios estan instalados..."
dpkg -s docker-ce docker-ce-cli containerd.io curl gnupg lsb-release &> /dev/null
if [ $? -ne 0 ]

        then
            echo "Los paquetes no estan instalados..."
            sleep 5
            echo "Instalando..."
            sleep 5
            sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
            echo "Agregando GPG key para docker..."
            sleep 5
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
             echo "Agregando repositorio..."
             sleep 5
             echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            echo "Actualizando repositorios"
            sleep 5
            sudo apt update
            sudo apt-get install docker-ce docker-ce-cli  containerd.io -y
            echo "Todos los paqutes han sido instalados correctamente..."
            sleep 5
            echo "Obteniendo imagen"
            sleep 5 
            sudo docker pull mattrayner/lamp
            echo "Configurando imagen"
            sleep 5
            sudo docker run -i -t --name autodoc -p "80:80" -p "3306:3306" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql mattrayner/lamp:latest
        else
            echo    "Los paquetes estan instalados..."
            sleep 5
            echo    "Configurando..."
            sleep 5
            echo "Obteniendo imagen"
            sleep 5
            sudo docker pull mattrayner/lamp
            echo "Configurando imagen"
            sleep 5
            sudo docker run -i -t --name autodoc -p "80:80" -p "3306:3306" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql mattrayner/lamp:latest
    fi


