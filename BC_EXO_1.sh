#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise 1: Create a simple directory structure ==="
        TITLE_SPACE=" "
        STEP1="1. Display your current directory with pwd."
        STEP2="2. Create a directory named 'projet' in your home directory."
        STEP3="3. Enter this directory with cd."
        STEP4="4. Create two subdirectories: 'docs' and 'src'."
        STEP5="5. List the directories to verify."
        STEP6="6. Create an empty file named 'readme.txt' in 'docs'."
        STEP7="7. Display the absolute path of your current directory."
        STEP8="8. Run this script to verify and get your flag."
        CHECKING="=== Checking in progress... ==="
        MSG_PROJECT_EXISTS="✅ The 'projet' directory exists: "
        MSG_PROJECT_NOT_EXISTS="❌ Error: The 'projet' directory does not exist in "
        MSG_DOCS_EXISTS="✅ The 'docs' subdirectory exists: "
        MSG_DOCS_NOT_EXISTS="❌ Error: The 'docs' subdirectory does not exist in "
        MSG_SRC_EXISTS="✅ The 'src' subdirectory exists: "
        MSG_SRC_NOT_EXISTS="❌ Error: The 'src' subdirectory does not exist in "
        MSG_README_EXISTS="✅ The 'readme.txt' file exists in "
        MSG_README_NOT_EXISTS="❌ Error: The 'readme.txt' file does not exist in "
        MSG_CURRENT_DIR_OK="✅ You are in the correct directory: "
        MSG_CURRENT_DIR_WRONG="❌ Error: You are not in the directory "
        MSG_CURRENT_DIR_CURRENT=" (current: "
        MSG_SUCCESS="🎉 Congratulations! All steps of Exercise 1 are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{a1b2c3d4}"
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
    else
        # Messages en français
        TITLE="=== Exercice 1 : Créer une arborescence simple ==="
        TITLE_SPACE=" "
        STEP1="1. Affiche ton répertoire actuel avec pwd."
        STEP2="2. Crée un dossier nommé projet dans ton répertoire personnel."
        STEP3="3. Entre dans ce dossier avec cd."
        STEP4="4. Crée deux sous-dossiers : docs et src."
        STEP5="5. Liste les dossiers pour vérifier."
        STEP6="6. Crée un fichier vide nommé readme.txt dans docs."
        STEP7="7. Affiche le chemin absolu de ton répertoire actuel."
        STEP8="8. Exécute ce script pour vérifier et obtenir ton flag."
        CHECKING="=== Vérification en cours... ==="
        MSG_PROJECT_EXISTS="✅ Le dossier projet existe : "
        MSG_PROJECT_NOT_EXISTS="❌ Erreur : Le dossier projet n'existe pas dans "
        MSG_DOCS_EXISTS="✅ Le sous-dossier docs existe : "
        MSG_DOCS_NOT_EXISTS="❌ Erreur : Le sous-dossier docs n'existe pas dans "
        MSG_SRC_EXISTS="✅ Le sous-dossier src existe : "
        MSG_SRC_NOT_EXISTS="❌ Erreur : Le sous-dossier src n'existe pas dans "
        MSG_README_EXISTS="✅ Le fichier readme.txt existe dans "
        MSG_README_NOT_EXISTS="❌ Erreur : Le fichier readme.txt n'existe pas dans "
        MSG_CURRENT_DIR_OK="✅ Tu es dans le bon répertoire : "
        MSG_CURRENT_DIR_WRONG="❌ Erreur : Tu n'es pas dans le répertoire "
        MSG_CURRENT_DIR_CURRENT=" (actuel : "
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes de l'exercice 1 sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{a1b2c3d4}"
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
    fi
}

# Choix initial de la langue
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
echo "$STEP1"
echo "$STEP2"
echo "$STEP3"
echo "$STEP4"
echo "$STEP5"
echo "$STEP6"
echo "$STEP7"
echo "$STEP8"
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
    echo "$STEP1"
    echo "$STEP2"
    echo "$STEP3"
    echo "$STEP4"
    echo "$STEP5"
    echo "$STEP6"
    echo "$STEP7"
    echo "$STEP8"
    echo " "
fi

# Demander confirmation avant la vérification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

echo " "
echo "$CHECKING"

# Récupérer le nom de l'utilisateur actuel
USER=$(whoami)

# Déterminer le répertoire personnel en fonction de l'utilisateur
if [ "$USER" = "root" ]; then
    HOME_DIR="/root"
else
    HOME_DIR="/home/$USER"
fi

PROJECT_DIR="$HOME_DIR/projet"
DOCS_DIR="$PROJECT_DIR/docs"
SRC_DIR="$PROJECT_DIR/src"
README_FILE="$DOCS_DIR/readme.txt"

# Vérifier si le dossier projet existe
if [ -d "$PROJECT_DIR" ]; then
    echo "$MSG_PROJECT_EXISTS $PROJECT_DIR"
else
    echo "$MSG_PROJECT_NOT_EXISTS$HOME_DIR"
    exit 1
fi

# Vérifier si le dossier docs existe
if [ -d "$DOCS_DIR" ]; then
    echo "$MSG_DOCS_EXISTS $DOCS_DIR"
else
    echo "$MSG_DOCS_NOT_EXISTS $PROJECT_DIR"
    exit 1
fi

# Vérifier si le dossier src existe
if [ -d "$SRC_DIR" ]; then
    echo "$MSG_SRC_EXISTS $SRC_DIR"
else
    echo "$MSG_SRC_NOT_EXISTS $PROJECT_DIR"
    exit 1
fi

# Vérifier si le fichier readme.txt existe dans docs
if [ -f "$README_FILE" ]; then
    echo "$MSG_README_EXISTS $DOCS_DIR"
else
    echo "$MSG_README_NOT_EXISTS $DOCS_DIR"
    exit 1
fi

# Vérifier si l'utilisateur est dans le bon répertoire
CURRENT_DIR=$(pwd)
if [ "$CURRENT_DIR" = "$PROJECT_DIR" ]; then
    echo "$MSG_CURRENT_DIR_OK $PROJECT_DIR"
else
    echo "$MSG_CURRENT_DIR_WRONG $PROJECT_DIR$MSG_CURRENT_DIR_CURRENT$CURRENT_DIR)"
    exit 1
fi

# Si tout est correct, afficher le message de succès et le flag
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"
