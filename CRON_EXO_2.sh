#!/bin/bash

# Function to set language-specific messages
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        GREETING="Hello, Linux Expert!"
        TITLE="=== Exercise: Daily Cron Job with Error Handling ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="You need to configure a daily cron job to clean temporary files. Follow the steps below:\n
1. Create a Bash script named '/home/user/clean_tmp.sh' that deletes files older than 7 days in '/tmp' and logs the number of deleted files to '/var/log/clean_tmp.log'.\n
2. Make the script executable.\n
3. Configure a cron job for the 'user' account to run this script daily at 2:00 AM.\n
4. Ensure the script's errors are redirected to '/var/log/clean_tmp_errors.log'.\n\n
Expected Outputs:\n
- '/home/user/clean_tmp.sh' exists and is executable.\n
- A correct cron job entry exists to run the script at 2:00 AM.\n
- '/var/log/clean_tmp.log' exists and logs the number of deleted files.\n
- '/var/log/clean_tmp_errors.log' exists to capture errors.\n
- Final flag: 'NoFD_{cron_daily}'"
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        MSG_CHECK_OK="✅ Check passed."
        MSG_CHECK_FAIL="❌ Check failed."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{cron_daily}"
        MSG_CHECK_SCRIPT="Checking if /home/user/clean_tmp.sh exists and is executable..."
        MSG_CHECK_CRON="Checking cron job for user 'user' (daily at 2:00 AM)..."
        MSG_CHECK_LOG="Checking /var/log/clean_tmp.log content..."
        MSG_CHECK_ERROR_LOG="Checking /var/log/clean_tmp_errors.log existence..."
    else
        GREETING="Bonjour, Expert Linux !"
        TITLE="=== Exercice : Tâche Cron quotidienne avec gestion des erreurs ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Vous devez configurer une tâche cron quotidienne pour nettoyer les fichiers temporaires. Suivez les étapes ci-dessous :\n
1. Créez un script Bash nommé '/home/user/clean_tmp.sh' qui supprime les fichiers de plus de 7 jours dans '/tmp' et enregistre le nombre de fichiers supprimés dans '/var/log/clean_tmp.log'.\n
2. Rendez le script exécutable.\n
3. Configurez une tâche cron pour l'utilisateur 'user' afin d'exécuter ce script tous les jours à 2h00 du matin.\n
4. Assurez-vous que les erreurs du script sont redirigées vers '/var/log/clean_tmp_errors.log'.\n\n
Résultats attendus :\n
- '/home/user/clean_tmp.sh' existe et est exécutable.\n
- Une entrée cron correcte existe pour exécuter le script à 2h00.\n
- '/var/log/clean_tmp.log' existe et enregistre le nombre de fichiers supprimés.\n
- '/var/log/clean_tmp_errors.log' existe pour capturer les erreurs.\n
- Drapeau final : 'NoFD_{cron_daily}'"
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        MSG_CHECK_OK="✅ Vérification réussie."
        MSG_CHECK_FAIL="❌ Vérification échouée."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton drapeau : NoFD_{cron_daily}"
        MSG_CHECK_SCRIPT="Vérification de l'existence et de l'exécutabilité de /home/user/clean_tmp.sh..."
        MSG_CHECK_CRON="Vérification de la tâche cron pour l'utilisateur 'user' (quotidienne à 2h00)..."
        MSG_CHECK_LOG="Vérification du contenu de /var/log/clean_tmp.log..."
        MSG_CHECK_ERROR_LOG="Vérification de l'existence de /var/log/clean_tmp_errors.log..."
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

# 1. Check if /home/user/clean_tmp.sh exists and is executable
echo -e "$MSG_CHECK_SCRIPT"
if [ -f /home/user/clean_tmp.sh ] && [ -x /home/user/clean_tmp.sh ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 2. Check cron job for user 'user'
echo -e "$MSG_CHECK_CRON"
if crontab -u user -l | grep -q "/home/user/clean_tmp.sh"; then
    CRON_LINE=$(crontab -u user -l | grep "/home/user/clean_tmp.sh")
    if [[ "$CRON_LINE" =~ ^[[:space:]]*0[[:space:]]+2[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*clean_tmp\.sh[[:space:]]+.*2>&1[[:space:]]+>>[[:space:]]+/var/log/clean_tmp_errors\.log ]]; then
        echo -e "$MSG_CHECK_OK"
    else
        echo -e "$MSG_CHECK_FAIL"
        exit 1
    fi
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 3. Check /var/log/clean_tmp.log content
echo -e "$MSG_CHECK_LOG"
if [ -f /var/log/clean_tmp.log ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 4. Check /var/log/clean_tmp_errors.log existence
echo -e "$MSG_CHECK_ERROR_LOG"
if [ -f /var/log/clean_tmp_errors.log ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# Final message
echo -e "\n$MSG_SUCCESS"
echo -e "$MSG_FLAG"
