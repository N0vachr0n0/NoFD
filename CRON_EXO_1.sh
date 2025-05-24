#!/bin/bash

# Function to set language-specific messages
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        GREETING="Hello, Linux Expert!"
        TITLE="=== Exercise: Simple Cron Job Scheduling ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="You need to configure a cron job on your system to run a script every 5 minutes. Follow the steps below:\n
1. Create a Bash script named '/home/user/backup.sh' that writes the current date and time to '/var/log/backup.log' (format: 'Backup at: <date>').\n
2. Make the script executable.\n
3. Configure a cron job for the 'user' account to run this script every 5 minutes.\n
4. Ensure the '/var/log/backup.log' file is created and contains at least one entry after execution.\n\n
Expected Outputs:\n
- '/home/user/backup.sh' exists and is executable.\n
- A correct cron job entry exists in the 'user' crontab.\n
- '/var/log/backup.log' contains at least one line in the format 'Backup at: <date>'.\n
- Final flag: 'NoFD_{cron_basic}'"
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        MSG_CHECK_OK="✅ Check passed."
        MSG_CHECK_FAIL="❌ Check failed."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{cron_basic}"
        MSG_CHECK_SCRIPT="Checking if /home/user/backup.sh exists and is executable..."
        MSG_CHECK_CRON="Checking cron job for user 'user'..."
        MSG_CHECK_LOG="Checking /var/log/backup.log content..."
    else
        GREETING="Bonjour, Expert Linux !"
        TITLE="=== Exercice : Planification d'une tâche Cron simple ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Vous devez configurer une tâche cron sur votre système pour exécuter un script toutes les 5 minutes. Suivez les étapes ci-dessous :\n
1. Créez un script Bash nommé '/home/user/backup.sh' qui écrit la date et l'heure actuelles dans '/var/log/backup.log' (format : 'Backup at: <date>').\n
2. Rendez le script exécutable.\n
3. Configurez une tâche cron pour l'utilisateur 'user' afin d'exécuter ce script toutes les 5 minutes.\n
4. Assurez-vous que le fichier '/var/log/backup.log' est créé et contient au moins une entrée après exécution.\n\n
Résultats attendus :\n
- '/home/user/backup.sh' existe et est exécutable.\n
- Une entrée cron correcte existe dans le crontab de l'utilisateur 'user'.\n
- '/var/log/backup.log' contient au moins une ligne au format 'Backup at: <date>'.\n
- Drapeau final : 'NoFD_{cron_basic}'"
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        MSG_CHECK_OK="✅ Vérification réussie."
        MSG_CHECK_FAIL="❌ Vérification échouée."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton drapeau : NoFD_{cron_basic}"
        MSG_CHECK_SCRIPT="Vérification de l'existence et de l'exécutabilité de /home/user/backup.sh..."
        MSG_CHECK_CRON="Vérification de la tâche cron pour l'utilisateur 'user'..."
        MSG_CHECK_LOG="Vérification du contenu de /var/log/backup.log..."
    fi
}

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo -e "❌ Erreur : Ce script doit être exécuté avec sudo.\n❌ Error: This script must be run with sudo."
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

clear

# Display the problem statement
echo -e "\n$TITLE\n$TITLE_SPACE"
echo -e "$GREETING"
echo -e "$INSTRUCTIONS\n"

# Allow language change
read -p "$PROMPT_CHANGE_LANG" CHANGE_LANG
if [[ "$CHANGE_LANG" = "1" || "$CHANGE_LANG" = "2" ]]; then
    LANG=$CHANGE_LANG
    set_language_messages
    clear
    echo -e "\n$TITLE\n$TITLE_SPACE"
    echo -e "$GREETING"
    echo -e "$INSTRUCTIONS\n"
fi

# Prompt for verification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

echo -e "\n$CHECKING"

# Verification checks

# 1. Check if /home/user/backup.sh exists and is executable
echo -e "$MSG_CHECK_SCRIPT"
if [ -f /home/user/backup.sh ] && [ -x /home/user/backup.sh ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 2. Check cron job for user 'user'
echo -e "$MSG_CHECK_CRON"
if crontab -u user -l | grep -q "/home/user/backup.sh"; then
    CRON_LINE=$(crontab -u user -l | grep "/home/user/backup.sh")
    if [[ "$CRON_LINE" =~ ^[[:space:]]*([0-9*\/,-]+)[[:space:]]+([0-9*\/,-]+)[[:space:]]+([0-9*\/,-]+)[[:space:]]+([0-9*\/,-]+)[[:space:]]+([0-9*\/,-]+)[[:space:]]+.*backup\.sh ]]; then
        MINUTE_FIELD="${BASH_REMATCH[1]}"
        if [ "$MINUTE_FIELD" = "*/5" ]; then
            echo -e "$MSG_CHECK_OK"
        else
            echo -e "$MSG_CHECK_FAIL"
            exit 1
        fi
    else
        echo -e "$MSG_CHECK_FAIL"
        exit 1
    fi
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 3. Check /var/log/backup.log content
echo -e "$MSG_CHECK_LOG"
if [ -f /var/log/backup.log ] && grep -q "^Backup at: " /var/log/backup.log; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# Final message
echo -e "\n$MSG_SUCCESS"
echo -e "$MSG_FLAG"
