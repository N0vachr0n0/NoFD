#!/bin/bash

# Function to set language-specific messages
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        GREETING="Hello, Linux Expert!"
        TITLE="=== Exercise: Advanced Cron Job with Dependencies ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="You need to configure a sequence of cron jobs to manage a backup and verification process. Follow the steps below:\n
1. Create a script '/home/user/backup_data.sh' that copies the contents of '/data' to '/backup/data_$(date +%F)'.\n
2. Create a script '/home/user/check_backup.sh' that checks if the backup folder for the current day exists and writes 'Backup OK' or 'Backup FAILED' to '/var/log/backup_check.log'.\n
3. Make both scripts executable.\n
4. Configure two cron jobs for the 'user' account:\n
   - Run 'backup_data.sh' daily at 3:00 AM.\n
   - Run 'check_backup.sh' daily at 3:05 AM.\n
5. Ensure '/var/log/backup_check.log' contains the verification result.\n\n
Expected Outputs:\n
- '/home/user/backup_data.sh' and '/home/user/check_backup.sh' exist and are executable.\n
- Two correct cron job entries exist for 3:00 AM and 3:05 AM.\n
- '/var/log/backup_check.log' contains 'Backup OK' or 'Backup FAILED'.\n
- Final flag: 'NoFD_{cron_advanced}'"
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        MSG_CHECK_OK="✅ Check passed."
        MSG_CHECK_FAIL="❌ Check failed."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{cron_advanced}"
        MSG_CHECK_BACKUP_SCRIPT="Checking if /home/user/backup_data.sh exists and is executable..."
        MSG_CHECK_CHECK_SCRIPT="Checking if /home/user/check_backup.sh exists and is executable..."
        MSG_CHECK_CRON="Checking cron jobs for user 'user' (3:00 AM and 3:05 AM)..."
        MSG_CHECK_LOG="Checking /var/log/backup_check.log content..."
    else
        GREETING="Bonjour, Expert Linux !"
        TITLE="=== Exercice : Tâche Cron avancée avec dépendances ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Vous devez configurer une séquence de tâches cron pour gérer une sauvegarde et une vérification. Suivez les étapes ci-dessous :\n
1. Créez un script '/home/user/backup_data.sh' qui copie le contenu de '/data' vers '/backup/data_$(date +%F)'.\n
2. Créez un script '/home/user/check_backup.sh' qui vérifie si le dossier de sauvegarde du jour existe et écrit 'Backup OK' ou 'Backup FAILED' dans '/var/log/backup_check.log'.\n
3. Rendez les deux scripts exécutables.\n
4. Configurez deux tâches cron pour l'utilisateur 'user' :\n
   - Exécutez 'backup_data.sh' tous les jours à 3h00.\n
   - Exécutez 'check_backup.sh' tous les jours à 3h05.\n
5. Assurez-vous que '/var/log/backup_check.log' contient le résultat de la vérification.\n\n
Résultats attendus :\n
- '/home/user/backup_data.sh' et '/home/user/check_backup.sh' existent et sont exécutables.\n
- Deux entrées cron correctes existent pour 3h00 et 3h05.\n
- '/var/log/backup_check.log' contient 'Backup OK' ou 'Backup FAILED'.\n
- Drapeau final : 'NoFD_{cron_advanced}'"
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        MSG_CHECK_OK="✅ Vérification réussie."
        MSG_CHECK_FAIL="❌ Vérification échouée."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton drapeau : NoFD_{cron_advanced}"
        MSG_CHECK_BACKUP_SCRIPT="Vérification de l'existence et de l'exécutabilité de /home/user/backup_data.sh..."
        MSG_CHECK_CHECK_SCRIPT="Vérification de l'existence et de l'exécutabilité de /home/user/check_backup.sh..."
        MSG_CHECK_CRON="Vérification des tâches cron pour l'utilisateur 'user' (3h00 et 3h05)..."
        MSG_CHECK_LOG="Vérification du contenu de /var/log/backup_check.log..."
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

# 1. Check if /home/user/backup_data.sh exists and is executable
echo -e "$MSG_CHECK_BACKUP_SCRIPT"
if [ -f /home/user/backup_data.sh ] && [ -x /home/user/backup_data.sh ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 2. Check if /home/user/check_backup.sh exists and is executable
echo -e "$MSG_CHECK_CHECK_SCRIPT"
if [ -f /home/user/check_backup.sh ] && [ -x /home/user/check_backup.sh ]; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 3. Check cron jobs for user 'user'
echo -e "$MSG_CHECK_CRON"
CRON_BACKUP=$(crontab -u user -l | grep "/home/user/backup_data.sh")
CRON_CHECK=$(crontab -u user -l | grep "/home/user/check_backup.sh")
if [ -n "$CRON_BACKUP" ] && [ -n "$CRON_CHECK" ]; then
    if [[ "$CRON_BACKUP" =~ ^[[:space:]]*0[[:space:]]+3[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*backup_data\.sh ]] && \
       [[ "$CRON_CHECK" =~ ^[[:space:]]*5[[:space:]]+3[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+.*check_backup\.sh ]]; then
        echo -e "$MSG_CHECK_OK"
    else
        echo -e "$MSG_CHECK_FAIL"
        exit 1
    fi
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# 4. Check /var/log/backup_check.log content
echo -e "$MSG_CHECK_LOG"
if [ -f /var/log/backup_check.log ] && grep -qE "Backup (OK|FAILED)" /var/log/backup_check.log; then
    echo -e "$MSG_CHECK_OK"
else
    echo -e "$MSG_CHECK_FAIL"
    exit 1
fi

# Final message
echo -e "\n$MSG_SUCCESS"
echo -e "$MSG_FLAG"
