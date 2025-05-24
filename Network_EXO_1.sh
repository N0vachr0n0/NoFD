#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: Exercise on troubleshooting networking and SSH issues
# Course Link: 

# Function to set language-specific messages
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # English messages
        GREETING="Hello, Linux Expert!"
        TITLE="=== Exercise: Networking and SSH Troubleshooting ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="We need your expertise to resolve issues on our system and perform additional tasks on 'host_1' and 'escalibur-host' (a remote server at IP 172.66.0.9). Both systems are running as Docker containers. Follow the steps below to diagnose and fix the problems:\n
1. DNS Issue: The 'curl' command to 'google.com' from 'host_1' is failing due to a DNS resolution issue. Diagnose and fix the problem to restore connectivity.
2. Hostname Resolution and Routing: We cannot ping 'escalibur-host' (IP: 172.66.0.9) from 'host_1'. Resolve the hostname and routing issues to ensure successful ping responses.
3. SSH Connectivity Check: Verify if SSH is accessible on 'escalibur-host' (172.66.0.9) using the 'nc' command. Record the OpenSSH version in '/var/tmp/openssh_version' on 'host_1' in the format 'SSH-x.x-OpenSSH_x.x'.
4. Script Execution and File Transfer: On 'escalibur-host', execute the 'triage' script located in '/home/hunter' as the root user. Then, copy both the 'triage' script and its output to '/var/result/' on 'host_1'. Use the SSH credentials: username 'hunter', password 'DzX237EYCo49PSFE7T'.
5. IP Configuration and Script Execution: The server at 172.66.0.9 has an interface with two IP addresses. Remove the secondary IP address, then execute the 'check' script located in '/home/hunter' as the root user. Copy the script's output to '/var/result/flag.txt' on 'host_1'.\n
Additional Notes:
- On 'host_1', some packages (e.g., 'ping') are missing. Use 'yum provides ping' to identify and install the required package."
        HINT="Hint: https://github.com/N0vachr0n0/NoFD/blob/main/Hint_NETWORK_CHALL.md"
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_RESET="Reset the challenge? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        PROMPT_CONFIG="Setting up the challenge environment..."
        MSG_CHECK_OK="✅ Check passed."
        MSG_CHECK_FAIL="❌ Check failed."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{N3tw0rk_ma1nt4in3r}"
        MSG_DOCKER="To start the challenge, enter the host_1 container with: 'docker exec -it host_1 bash'"
        MSG_DOCKER_ERROR="❌ Error: Docker is not installed or not running. Please install Docker and ensure the daemon is active. Refer to https://docs.docker.com/get-docker/ for installation instructions."
        MSG_CHECK_DNS="Checking DNS resolution (curl to google.com)..."
        MSG_CHECK_PING="Checking ping to escalibur-host (172.66.0.9)..."
        MSG_CHECK_SSH="Checking OpenSSH version in /var/tmp/openssh_version..."
        MSG_CHECK_TRIAGE="Checking triage script and output in /var/result/..."
        MSG_CHECK_IP_FLAG="Checking flag.txt content and secondary IP removal..."
    else
        # French messages
        GREETING="Bonjour, Expert Linux !"
        TITLE="=== Exercice : Dépannage réseau et SSH ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Nous avons besoin de votre expertise pour résoudre des problèmes sur nos systèmes 'host_1' et 'escalibur-host' (un serveur distant à l'IP 172.66.0.9). Les deux systèmes fonctionnent comme des conteneurs Docker. Suivez les étapes ci-dessous pour diagnostiquer et corriger les problèmes :\n
1. Problème DNS : La commande 'curl' vers 'google.com' depuis 'host_1' échoue en raison d'un problème de résolution DNS. Diagnostiquez et corrigez le problème pour rétablir la connectivité.
2. Résolution de nom d'hôte et routage : Nous ne pouvons pas pinguer 'escalibur-host' (IP : 172.66.0.9) depuis 'host_1'. Résolvez les problèmes de nom d'hôte et de routage pour assurer des réponses ping réussies.
3. Vérification de la connectivité SSH : Vérifiez si SSH est accessible sur 'escalibur-host' (172.66.0.9) en utilisant la commande 'nc'. Enregistrez la version d'OpenSSH dans '/var/tmp/openssh_version' sur 'host_1' au format 'SSH-x.x-OpenSSH_x.x'.
4. Exécution de script et transfert de fichiers : Sur 'escalibur-host', exécutez le script 'triage' situé dans '/home/hunter' en tant qu'utilisateur root. Ensuite, copiez le script 'triage' et son résultat dans '/var/result/' sur 'host_1'. Utilisez les identifiants SSH : utilisateur 'hunter', mot de passe 'DzX237EYCo49PSFE7T'.
5. Configuration IP et exécution de script : Le serveur à l'adresse 172.66.0.9 possède une interface avec deux adresses IP. Supprimez la seconde adresse IP, puis exécutez le script 'check' situé dans '/home/hunter' en tant qu'utilisateur root. Copiez le résultat dans '/var/result/flag.txt' sur 'host_1'.\n
Notes supplémentaires :
- Sur 'host_1', certains paquets (par exemple, 'ping') sont absents. Utilisez 'yum provides ping' pour identifier et installer le paquet requis."
        HINT="Indice : https://github.com/N0vachr0n0/NoFD/blob/main/Hint_NETWORK_CHALL.md"
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_RESET="Réinitialiser le challenge ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        PROMPT_CONFIG="Configuration de l'environnement du challenge..."
        MSG_CHECK_OK="✅ Vérification réussie."
        MSG_CHECK_FAIL="❌ Vérification échouée."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{N3tw0rk_ma1nt4in3r}"
        MSG_DOCKER="Pour commencer le challenge, entrez dans le conteneur host_1 avec : 'docker exec -it host_1 bash'"
        MSG_DOCKER_ERROR="❌ Erreur : Docker n'est pas installé ou ne fonctionne pas. Veuillez installer Docker et vous assurer que le démon est actif. Consultez https://docs.docker.com/get-docker/ pour les instructions d'installation."
        MSG_CHECK_DNS="Vérification de la résolution DNS (curl vers google.com)..."
        MSG_CHECK_PING="Vérification du ping vers escalibur-host (172.66.0.9)..."
        MSG_CHECK_SSH="Vérification de la version OpenSSH dans /var/tmp/openssh_version..."
        MSG_CHECK_TRIAGE="Vérification du script triage et de son résultat dans /var/result/..."
        MSG_CHECK_IP_FLAG="Vérification du contenu de flag.txt et suppression de l'IP secondaire..."
    fi
}

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo -e "❌ Erreur : Ce script doit être exécuté avec sudo.\n❌ Error: This script must be run with sudo."
    exit 1
fi

# Check if Docker is installed and running
if ! command -v docker >/dev/null 2>&1; then
    echo -e "$MSG_DOCKER_ERROR"
    exit 1
fi
if ! docker info >/dev/null 2>&1; then
    echo -e "$MSG_DOCKER_ERROR"
    exit 1
fi

# Prompt user to choose language
echo -e "Choose your language / Choisissez votre langue :"
echo -e "1. Français"
echo -e "2. English"
read -p "Enter 1 or 2 / Entrez 1 ou 2 : " LANG

# Validate language choice
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    echo -e "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English."
    exit 1
fi

# Set messages based on chosen language
set_language_messages

# Prompt to reset the challenge
read -p "$PROMPT_RESET" RESET
if [[ "$RESET" = "y" || "$RESET" = "Y" || "$RESET" = "o" || "$RESET" = "O" ]]; then
    echo -e "Resetting the challenge...\nRéinitialisation du challenge..."
    # Execute the purge script silently
    curl -s https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/purge-network-chall-setup.sh | bash >/dev/null 2>&1
    echo -e "Challenge reset complete.\nRéinitialisation terminée."
    exit 0
fi

clear

# Initial setup
CONFIG_FILE="/var/tmp/network_chall_config_done"
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "$PROMPT_CONFIG"
    sleep 2
    # Execute the setup script silently
    curl -s https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/setup-network-chall.sh | bash >/dev/null 2>&1
    echo -e "✅ Environment setup completed."
    touch "$CONFIG_FILE"
fi

# Display the problem statement
echo -e "\n$TITLE\n$TITLE_SPACE"
echo -e "$GREETING"
echo -e "$INSTRUCTIONS\n"
echo -e "$MSG_DOCKER"
#echo -e "$HINT\n"

# Allow language change
read -p "$PROMPT_CHANGE_LANG" CHANGE_LANG
if [[ "$CHANGE_LANG" = "1" || "$CHANGE_LANG" = "2" ]]; then
    LANG=$CHANGE_LANG
    set_language_messages
    clear
    echo -e "\n$TITLE\n$TITLE_SPACE"
    echo -e "$GREETING"
    echo -e "$INSTRUCTIONS\n"
    echo -e "$MSG_DOCKER"
    #echo -e "$HINT\n"
fi

# Prompt for verification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

echo -e "\n$CHECKING"

# Verification checks

# 1. Check DNS resolution (curl to google.com)
echo -e "$MSG_CHECK_DNS"
if docker exec host_1 curl -s --connect-timeout 5 google.com >/dev/null 2>&1; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 2. Check ping to escalibur-host
echo -e "$MSG_CHECK_PING"
if docker exec host_1 ping -c 1 escalibur-host >/dev/null 2>&1; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 3. Check OpenSSH version in /var/tmp/openssh_version
echo -e "$MSG_CHECK_SSH"
if docker exec host_1 test -f /var/tmp/openssh_version && [ "$(docker exec host_1 cat /var/tmp/openssh_version)" = "SSH-2.0-OpenSSH_7.4" ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 4. Check triage script and output in /var/result/
echo -e "$MSG_CHECK_TRIAGE"
TRIAGE_HOST1=$(docker exec host_1 md5sum /var/result/triage | awk '{print $1}')
TRIAGE_HOST2=$(docker exec host_2 md5sum /home/hunter/triage | awk '{print $1}')

INST_HOST1=$(docker exec host_1 md5sum /var/result/instruction.txt | awk '{print $1}')
INST_HOST2=$(docker exec host_2 md5sum /home/hunter/instruction.txt | awk '{print $1}')

if [[ "$TRIAGE_HOST1" == "$TRIAGE_HOST2" && "$INST_HOST1" == "$INST_HOST2" ]]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 5. Check flag.txt and secondary IP removal
echo -e "$MSG_CHECK_IP_FLAG"
if docker exec host_1 test -f /var/result/flag.txt && [ "$(docker exec host_1 cat /var/result/flag.txt)" = "NoFD_{1pm4n4g3r}" ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# Final message
echo -e "\n$MSG_SUCCESS"
echo -e "$MSG_FLAG"

echo
echo "Thanks"
read -p "$PROMPT_RESET" RESET
if [[ "$RESET" = "y" || "$RESET" = "Y" || "$RESET" = "o" || "$RESET" = "O" ]]; then
    echo -e "Resetting the challenge...\nRéinitialisation du challenge..."
    # Execute the purge script silently
    rm -f "$CONFIG_FILE"
    curl -s https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/purge-network-chall-setup.sh | bash >/dev/null 2>&1
    echo -e "Challenge reset complete.\nRéinitialisation terminée."
    exit 0
fi
