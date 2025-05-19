#!/bin/bash

# GitHub Repository: <Remplacer par votre URL GitHub>
# Description: Exercise on troubleshooting a systemd backup service
# Course Link: <Remplacer par l'URL du cours>

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: Systemd Backup Service Troubleshooting ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Hello, Linux expert!\nThe backup-etc.service, responsible for automatic backups of configuration files in /etc, is no longer running correctly. Your mission is to diagnose and fix the issues to restore the hourly backups triggered by the backup-etc.timer. Additionally, when a backup is performed, the /var/log/backup.log file is updated with the operation details."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        PROMPT_CONFIG="Initial configuration is being set up..."
        MSG_CHECK_OK="✅ Check passed."
        MSG_CHECK_FAIL="❌ Check failed."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{systemd_backup_troubleshooting}"
    else
        # Messages en français
        TITLE="=== Exercice : Dépannage d'un service de sauvegarde systemd ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Bonjour, expert Linux !\nLe service backup-etc.service, responsable des sauvegardes automatiques des fichiers de configuration dans /etc, ne s'exécute plus correctement. Votre mission est de diagnostiquer et corriger les problèmes pour restaurer les sauvegardes horaires déclenchées par le timer backup-etc.timer. De plus, lorsqu'une sauvegarde est effectuée, le fichier de log /var/log/backup.log est mis à jour avec les détails de l'opération."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        PROMPT_CONFIG="La configuration initiale est en cours..."
        MSG_CHECK_OK="✅ Vérification réussie."
        MSG_CHECK_FAIL="❌ Vérification échouée."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{systemd_backup_troubleshooting}"
    fi
}

# Vérifier si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
    printf "❌ Erreur : Ce script doit être exécuté avec sudo.\n❌ Error: This script must be run with sudo.\n"
    exit 1
fi

# Demander à l'utilisateur de choisir une langue
printf "Choose your language / Choisissez votre langue :\n"
printf "1. Français\n"
printf "2. English\n"
read -p "Enter 1 or 2 / Entrez 1 ou 2 : " LANG

# Vérifier si la langue choisie est valide
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    printf "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English.\n"
    exit 1
fi

clear

# Définir les messages selon la langue choisie
set_language_messages

# Configuration initiale
CONFIG_FILE="/var/tmp/backup_service_config_done"
if [ ! -f "$CONFIG_FILE" ]; then
    printf "%s\n" "$PROMPT_CONFIG"
    sleep 2

    # Nettoyer les fichiers résiduels
    rm -rf /var/backups /var/tmp/verif /var/log/backup.log
    rm -f /usr/local/bin/backup-etc.sh /etc/systemd/system/backup-etc.service /etc/systemd/system/backup-etc.timer

    # Créer le script de sauvegarde
    cat << 'EOF' > /usr/local/bin/backup-etc.sh
#!/bin/bash
# Directory to backup
SOURCE_DIR="/etc"
# Backup destination directory
BACKUP_DIR="/var/backups"
# Log file
LOG_FILE="/var/log/backup.log"
# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"
# Generate filename with timestamp
DATE=$(date +"%Y%m%d_%H%M")
BACKUP_NAME="backup_etc_$DATE.tar.gz"
# Create tar.gz archive
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" >> /dev/null 2>&1
# Log result
if [ $? -eq 0 ]; then
    echo "$(date) - Backup created: $BACKUP_DIR/$BACKUP_NAME" >> "$LOG_FILE"
else
    echo "$(date) - ERROR: Failed to create backup of $SOURCE_DIR" >> "$LOG_FILE"
fi
EOF
    chmod +x /usr/local/bin/backup-etc.sh
    chown root:root /usr/local/bin/backup-etc.sh

    # Créer le service systemd
    cat << 'EOF' > /etc/systemd/system/backup-etc.service
[Unit]
Description=Backup Service for /etc Directory
After=network.target
[Service]
Type=oneshot
ExecStart=/usr/local/bin/backup-etc.sh
User=root
Environment="PATH=/usr/bin:/usr/sbin:/bin"
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=backup-etc
[Install]
WantedBy=multi-user.target
EOF

    # Créer le timer systemd
    cat << 'EOF' > /etc/systemd/system/backup-etc.timer
[Unit]
Description=Run /etc backup every hour
[Timer]
OnCalendar=hourly
AccuracySec=1min
Persistent=true
Unit=backup-etc.service
[Install]
WantedBy=timers.target
EOF

    # Activer et démarrer le timer
    systemctl daemon-reload
    systemctl enable backup-etc.timer
    systemctl start backup-etc.timer

    # Exécuter le service pour générer un log
    systemctl start backup-etc.service
    sleep 2

    # Copier le log dans /var/tmp/verif
    if [ -f "/var/log/backup.log" ]; then
        cp /var/log/backup.log /var/tmp/verif
    fi

    # Introduire les erreurs
    chattr +i /var/log/backup.log
    chmod -x /usr/local/bin/backup-etc.sh
    sed -i 's|ExecStart=/usr/local/bin/backup-etc.sh|ExecStart=/usr/local/backup-etc.sh|' /etc/systemd/system/backup-etc.service
    systemctl daemon-reload

    # Tenter de démarrer le service (devrait échouer)
    systemctl start backup-etc.service >/dev/null 2>&1 || true

    touch "$CONFIG_FILE"
fi

# Afficher l'énoncé
printf "\n"
printf "%s\n" "$TITLE"
printf "%s\n" "$TITLE_SPACE"
printf "%s\n\n" "$INSTRUCTIONS"

# Donner la possibilité de changer la langue
read -p "$PROMPT_CHANGE_LANG" CHANGE_LANG
if [[ "$CHANGE_LANG" = "1" || "$CHANGE_LANG" = "2" ]]; then
    LANG=$CHANGE_LANG
    set_language_messages
    clear
    printf "\n"
    printf "%s\n" "$TITLE"
    printf "%s\n" "$TITLE_SPACE"
    printf "%s\n\n" "$INSTRUCTIONS"
fi

# Demander confirmation avant la vérification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

printf "\n"
printf "%s\n" "$CHECKING"

# Vérifications

# 1. Vérifier que /var/log/backup.log n'est pas immuable
if lsattr /var/log/backup.log 2>/dev/null | grep -q -- '----i'; then
    printf "%s\n" "$MSG_CHECK_FAIL"
    exit 1
else
    printf "%s\n" "$MSG_CHECK_OK"
fi

# 2. Vérifier que backup-etc.service pointe vers /usr/local/bin/backup-etc.sh
if grep -q "ExecStart=/usr/local/bin/backup-etc.sh" /etc/systemd/system/backup-etc.service; then
    printf "%s\n" "$MSG_CHECK_OK"
else
    printf "%s\n" "$MSG_CHECK_FAIL"
    exit 1
fi

# 3. Vérifier que la première ligne de /var/tmp/verif correspond à celle de /var/log/backup.log
if [ -f "/var/tmp/verif" ] && [ -f "/var/log/backup.log" ]; then
    VERIF_LINE=$(head -n 1 /var/tmp/verif)
    LOG_LINE=$(head -n 1 /var/log/backup.log)
    if [ "$VERIF_LINE" = "$LOG_LINE" ] && [ -n "$VERIF_LINE" ]; then
        printf "%s\n" "$MSG_CHECK_OK"
    else
        printf "%s\n" "$MSG_CHECK_FAIL"
        exit 1
    fi
else
    printf "%s\n" "$MSG_CHECK_FAIL"
    exit 1
fi

# Supprimer le fichier temporaire de configuration
rm -f "$CONFIG_FILE"

# Message de fin
printf "\n"
printf "%s\n" "$MSG_SUCCESS"
printf "%s\n" "$MSG_FLAG"
