#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: File Management and Archiving with find, tar, and zip ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Follow the steps below to complete the exercise:"
        STEP1="1. Download the 'rsc_img_log_txt.zip' archive using curl from https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/rsc_img_log_txt.zip into your home directory. Unzip it to get the 'rsc_img_log_txt' directory."
        STEP2="2. From the root of 'rsc_img_log_txt', use find to list all '.jpg' files in this directory and its subdirectories with relative paths starting with './'. Save the list in 'liste_images.txt' at the root of 'rsc_img_log_txt'. Example content (not the answer): ./photos/image1.jpg, ./images/vacances/photo2.jpg."
        STEP3="3. Create a 'documents.tar.gz' archive with all '.txt' files in 'rsc_img_log_txt' and its subdirectories (files only, no directories), saved at the root."
        STEP4="4. Add all '.jpg' files from 'rsc_img_log_txt' to the existing 'pictures.zip' archive, which initially contains '47.jpg', '48.jpg', and '49.jpg'. Leave it at the root of 'rsc_img_log_txt'."
        STEP5="5. Create a 'logs.zip' archive with all '.log' files in 'rsc_img_log_txt' and its subdirectories, saved at the root."
        STEP6="6. Move 'documents.tar.gz' and 'logs.zip' to the 'backup' subdirectory."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "

        MSG_DOWNLOAD_OK="✅ The 'rsc_img_log_txt' directory exists (archive downloaded and unzipped)."
        MSG_DOWNLOAD_FAIL="❌ Error: The 'rsc_img_log_txt' directory does not exist."
        MSG_LIST_OK="✅ 'liste_images.txt' contains the correct list of '.jpg' files with relative paths starting with './' and remains at the root."
        MSG_LIST_WRONG="❌ Error: 'liste_images.txt' is missing, contains incorrect paths, or is not at the root."
        MSG_TAR_OK="✅ 'documents.tar.gz' contains all 4 '.txt' files (without directories) and is in 'backup'."
        MSG_TAR_WRONG="❌ Error: 'documents.tar.gz' is missing, does not contain all 4 '.txt' files (without directories), or is not in 'backup'."
        MSG_PICTURES_OK="✅ 'pictures.zip' contains all 6 '.jpg' files (initial 3 + added 3) and remains at the root."
        MSG_PICTURES_WRONG="❌ Error: 'pictures.zip' is missing, does not contain all 6 '.jpg' files, or is not at the root."
        MSG_LOGS_OK="✅ 'logs.zip' contains all 2 '.log' files and is in 'backup'."
        MSG_LOGS_WRONG="❌ Error: 'logs.zip' is missing, does not contain all 2 '.log' files, or is not in 'backup'."
        MSG_BACKUP_OK="✅ The 2 required files are in the 'backup' directory."
        MSG_BACKUP_WRONG="❌ Error: Some required files are missing from the 'backup' directory."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{file_archive_master}"
    else
        # Messages en français
        TITLE="=== Exercice : Gestion et Archivage de Fichiers avec find, tar et zip ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Suivez les étapes ci-dessous pour compléter l'exercice :"
        STEP1="1. Téléchargez l'archive 'rsc_img_log_txt.zip' avec curl depuis https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/rsc_img_log_txt.zip dans votre répertoire personnel. Décompressez-la pour obtenir le dossier 'rsc_img_log_txt'."
        STEP2="2. Depuis la racine de 'rsc_img_log_txt', utilisez find pour lister tous les fichiers '.jpg' dans ce dossier et ses sous-dossiers avec leurs chemins relatifs commençant par './'. Sauvegardez la liste dans 'liste_images.txt' à la racine de 'rsc_img_log_txt'. Exemple de contenu (pas la réponse) : ./photos/image1.jpg, ./images/vacances/photo2.jpg."
        STEP3="3. Créez une archive 'documents.tar.gz' avec tous les fichiers '.txt' dans 'rsc_img_log_txt' et ses sous-dossiers (seulement les fichiers, sans répertoires), sauvegardée à la racine."
        STEP4="4. Ajoutez tous les fichiers '.jpg' de 'rsc_img_log_txt' à l'archive existante 'pictures.zip', qui contient initialement '47.jpg', '48.jpg' et '49.jpg'. Laissez-la à la racine de 'rsc_img_log_txt'."
        STEP5="5. Créez une archive 'logs.zip' avec tous les fichiers '.log' dans 'rsc_img_log_txt' et ses sous-dossiers, sauvegardée à la racine."
        STEP6="6. Déplacez 'documents.tar.gz' et 'logs.zip' dans le sous-dossier 'backup'."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "

        MSG_DOWNLOAD_OK="✅ Le dossier 'rsc_img_log_txt' existe (archive téléchargée et décompressée)."
        MSG_DOWNLOAD_FAIL="❌ Erreur : Le dossier 'rsc_img_log_txt' n'existe pas."
        MSG_LIST_OK="✅ 'liste_images.txt' contient la liste correcte des fichiers '.jpg' avec leurs chemins relatifs commençant par './' et reste à la racine."
        MSG_LIST_WRONG="❌ Erreur : 'liste_images.txt' est manquant, contient des chemins incorrects, ou n'est pas à la racine."
        MSG_TAR_OK="✅ 'documents.tar.gz' contient les 4 fichiers '.txt' (sans répertoires) et est dans 'backup'."
        MSG_TAR_WRONG="❌ Erreur : 'documents.tar.gz' est manquante, ne contient pas les 4 fichiers '.txt' (sans répertoires), ou n'est pas dans 'backup'."
        MSG_PICTURES_OK="✅ 'pictures.zip' contient les 6 fichiers '.jpg' (3 initiaux + 3 ajoutés) et reste à la racine."
        MSG_PICTURES_WRONG="❌ Erreur : 'pictures.zip' est manquante, ne contient pas les 6 fichiers '.jpg', ou n'est pas à la racine."
        MSG_LOGS_OK="✅ 'logs.zip' contient les 2 fichiers '.log' et est dans 'backup'."
        MSG_LOGS_WRONG="❌ Erreur : 'logs.zip' est manquante, ne contient pas les 2 fichiers '.log', ou n'est pas dans 'backup'."
        MSG_BACKUP_OK="✅ Les 2 fichiers requis sont dans le dossier 'backup'."
        MSG_BACKUP_WRONG="❌ Erreur : Certains fichiers requis manquent dans le dossier 'backup'."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{file_archive_master}"
    fi
}

# Demander à l'utilisateur de choisir une langue
echo "Choose your language / Choisissez votre langue :"
echo "1. Français"
echo "2. English"
read -p "Enter 1 or 2 / Entrez 1 ou 2 : " LANG

# Vérifier si la langue choisie est valide
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    echo "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English. / Choix invalide. Veuillez sélectionner 1 pour Français ou 2 pour English."
    exit 1
fi

clear

# Définir les messages selon la langue choisie
set_language_messages

# Afficher l'énoncé avec espace après le titre
echo " "
echo "$TITLE"
echo "$TITLE_SPACE"
echo "$INSTRUCTIONS"
echo "$STEP1"
echo "$STEP2"
echo "$STEP3"
echo "$STEP4"
echo "$STEP5"
echo "$STEP6"
echo " "

# Donner la possibilité de changer la langue
read -p "$PROMPT_CHANGE_LANG" CHANGE_LANG
if [[ "$CHANGE_LANG" = "1" || "$CHANGE_LANG" = "2" ]]; then
    LANG=$CHANGE_LANG
    set_language_messages
    clear
    echo " "
    echo "$TITLE"
    echo "$TITLE_SPACE"
    echo "$INSTRUCTIONS"
    echo "$STEP1"
    echo "$STEP2"
    echo "$STEP3"
    echo "$STEP4"
    echo "$STEP5"
    echo "$STEP6"
    echo " "
fi

# Demander confirmation avant la vérification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

echo " "
echo "$CHECKING"

# Déterminer le répertoire personnel
USER=$(whoami)
if [ "$USER" = "root" ]; then
    HOME_DIR="/root"
else
    HOME_DIR="/home/$USER"
fi

PROJECT_DIR="$HOME_DIR/rsc_img_log_txt"
LIST_FILE="$PROJECT_DIR/liste_images.txt"
TAR_FILE="$PROJECT_DIR/backup/documents.tar.gz"  # Emplacement final dans backup
PICTURES_ZIP="$PROJECT_DIR/pictures.zip"
LOGS_ZIP="$PROJECT_DIR/backup/logs.zip"          # Emplacement final dans backup
BACKUP_DIR="$PROJECT_DIR/backup"

# Étape 1 : Vérifier l'existence du dossier rsc_img_log_txt (pas l'archive)
[ -d "$PROJECT_DIR" ] && echo "$MSG_DOWNLOAD_OK" || { NAR="$MSG_DOWNLOAD_FAIL"; exit 1; }

# Étape 2 : Vérifier liste_images.txt avec chemins relatifs commençant par ./
if [ -f "$LIST_FILE" ]; then
    ACTUAL_LIST=$(cat "$LIST_FILE" | sort)
    EXPECTED_CONTENT=$(echo -e "./50.jpg\n./51.jpg\n./wip/37.jpg" | sort)
    if [ "$ACTUAL_LIST" = "$EXPECTED_CONTENT" ]; then
        echo "$MSG_LIST_OK"
    else
        echo "$MSG_LIST_WRONG"
        exit 1
    fi
else
    echo "$MSG_LIST_WRONG"
    exit 1
fi

# Étape 3 : Vérifier documents.tar.gz (4 fichiers .txt sans répertoires) dans backup
if [ -f "$TAR_FILE" ]; then
    ACTUAL_TXT_FILES=$(tar -tzf "$TAR_FILE" | grep -c ".txt$")
    EXPECTED_TXT_FILES=4  # lesson_1.txt, notes.txt, notes_wip.txt, liste_images.txt (sans répertoires)
    TAR_CONTENT=$(tar -tzf "$TAR_FILE" | sort)
    EXPECTED_TAR_CONTENT=$(echo -e "lesson_1.txt\nnotes.txt\nnotes_wip.txt\nliste_images.txt" | sort)
    [ "$ACTUAL_TXT_FILES" -eq "$EXPECTED_TXT_FILES" ] && [ "$TAR_CONTENT" = "$EXPECTED_TAR_CONTENT" ] && echo "$MSG_TAR_OK" || { echo "$MSG_TAR_WRONG"; exit 1; }
else
    echo "$MSG_TAR_WRONG"
    exit 1
fi

# Étape 4 : Vérifier pictures.zip (6 fichiers .jpg : 47, 48, 49 + 50, 51, 37) à la racine
if [ -f "$PICTURES_ZIP" ]; then
    ACTUAL_JPG_FILES=$(unzip -l "$PICTURES_ZIP" | grep -c ".jpg$")
    EXPECTED_JPG_FILES=6  # 47.jpg, 48.jpg, 49.jpg (initial) + 50.jpg, 51.jpg, wip/37.jpg
    PICTURES_CONTENT=$(unzip -l "$PICTURES_ZIP" | awk '/\.jpg$/ {print $4}' | sort)
    EXPECTED_PICTURES_CONTENT=$(echo -e "47.jpg\n48.jpg\n49.jpg\n50.jpg\n51.jpg\nwip/37.jpg" | sort)
    [ "$ACTUAL_JPG_FILES" -eq "$EXPECTED_JPG_FILES" ] && [ "$PICTURES_CONTENT" = "$EXPECTED_PICTURES_CONTENT" ] && echo "$MSG_PICTURES_OK" || { echo "$MSG_PICTURES_WRONG"; exit 1; }
else
    echo "$MSG_PICTURES_WRONG"
    exit 1
fi

# Étape 5 : Vérifier logs.zip (2 fichiers .log) dans backup
if [ -f "$LOGS_ZIP" ]; then
    ACTUAL_LOG_FILES=$(unzip -l "$LOGS_ZIP" | grep -c ".log$")
    EXPECTED_LOG_FILES=2  # extract_syslog.log, web_app.log
    LOGS_CONTENT=$(unzip -l "$LOGS_ZIP" | awk '/\.log$/ {print $4}' | sort)
    EXPECTED_LOGS_CONTENT=$(echo -e "log/extract_syslog.log\nlog/web_app.log" | sort)
    [ "$ACTUAL_LOG_FILES" -eq "$EXPECTED_LOG_FILES" ] && [ "$LOGS_CONTENT" = "$EXPECTED_LOGS_CONTENT" ] && echo "$MSG_LOGS_OK" || { echo "$MSG_LOGS_WRONG"; exit 1; }
else
    echo "$MSG_LOGS_WRONG"
    exit 1
fi

# Étape 6 : Vérifier le dossier backup (2 fichiers)
if [ -d "$BACKUP_DIR" ]; then
    BACKUP_FILES=$(find "$BACKUP_DIR" -maxdepth 1 -type f | wc -l)
    [ "$BACKUP_FILES" -eq 2 ] || { echo "$MSG_BACKUP_WRONG"; exit 1; }
    for file in "documents.tar.gz" "logs.zip"; do
        [ -f "$BACKUP_DIR/$file" ] || { echo "$MSG_BACKUP_WRONG"; exit 1; }
    done
    echo "$MSG_BACKUP_OK"
else
    echo "$MSG_BACKUP_WRONG"
    exit 1
fi

# Message de succès
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"
