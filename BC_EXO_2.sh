#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev
# Course Link: 

# Demander à l'utilisateur de choisir une langue
echo "Choose your language / Choisissez votre langue :"
echo "1. Français"
echo "2. English"
read -p "Enter 1 or 2 / Entrez 1 ou 2 : " LANG

# Vérifier si la langue choisie est valide (strictement 1 ou 2)
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    echo "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English. / Choix invalide. Veuillez sélectionner 1 pour Français ou 2 pour English."
    exit 1
fi

# Définir les messages en fonction de la langue choisie
if [ "$LANG" = "2" ]; then
    # Messages en anglais
    TITLE="=== Exercise: Create, Copy, Move, Delete, and Symbolic Links ==="
    STEP1="1. Display your current directory with pwd."
    STEP2="2. Create a directory named 'projet 2' in your home directory."
    STEP3="3. Enter this directory with cd."
    STEP4="4. Create two subdirectories: 'config' and 'bin'."
    STEP5="5. Create an empty file named 'readme.txt' in 'config'."
    STEP6="6. Add the string 'Wls4RuCgpltcs9smUa' to 'readme.txt'."
    STEP7="7. Copy 'readme.txt' from 'config' to 'bin' as 'readme_copy.txt'."
    STEP8="8. Copy 'readme_copy.txt' to 'readme_copy_parent.txt' and move it to the parent directory (projet 2)."
    STEP9="9. Remove the 'backup' directory located in your home directory (use the appropriate option to delete non-empty directories)."
    STEP10="10. List files in 'projet 2' to verify."
    STEP11="11. Create a symbolic link named 'lien_vers_readme' pointing to 'readme_copy_parent.txt'."
    STEP12="12. List files with details to verify the symbolic link."
    STEP13="13. Remove the symbolic link."
    CHECKING="=== Checking in progress... ==="

    MSG_OK_CONFIG="✅ Configuration completed. The file 'OK' has been created."
    MSG_ALREADY_CONFIGURED="✅ Configuration already done. The file 'OK' exists."
    MSG_PROJECT_EXISTS="✅ The directory 'projet 2' exists."
    MSG_PROJECT_NOT_EXISTS="❌ Error: The directory 'projet 2' does not exist."
    MSG_CONFIG_EXISTS="✅ The 'config' subdirectory exists."
    MSG_CONFIG_NOT_EXISTS="❌ Error: The 'config' subdirectory does not exist."
    MSG_BIN_EXISTS="✅ The 'bin' subdirectory exists."
    MSG_BIN_NOT_EXISTS="❌ Error: The 'bin' subdirectory does not exist."
    MSG_README_EXISTS="✅ The file 'readme.txt' exists."
    MSG_README_NOT_EXISTS="❌ Error: The file 'readme.txt' does not exist."
    MSG_README_CONTENT_OK="✅ The content of 'readme.txt' is correct."
    MSG_README_CONTENT_WRONG="❌ Error: The content of 'readme.txt' is incorrect."
    MSG_README_COPY_OK="✅ 'readme_copy.txt' exists in the correct location."
    MSG_README_COPY_WRONG="❌ Error: 'readme_copy.txt' is missing or misplaced."
    MSG_README_PARENT_OK="✅ 'readme_copy_parent.txt' has been copied and moved to the parent directory."
    MSG_README_PARENT_WRONG="❌ Error: 'readme_copy_parent.txt' is not in the parent directory."
    MSG_BACKUP_REMOVED="✅ The 'backup' directory has been successfully removed."
    MSG_BACKUP_NOT_REMOVED="❌ Error: The 'backup' directory still exists."
    MSG_SYMLINK_OK="✅ The symbolic link 'lien_vers_readme' exists and points to 'readme_copy_parent.txt'."
    MSG_SYMLINK_WRONG="❌ Error: The symbolic link 'lien_vers_readme' is missing or incorrect."
    MSG_SUCCESS="🎉 Congratulations! All steps are correct."
    MSG_FLAG="🏁 Your flag: NoFD_{b3c4d5e6}"
else
    # Messages en français
    TITLE="=== Exercice : Créer, Copier, Déplacer, Supprimer et Liens Symboliques ==="
    STEP1="1. Affiche ton répertoire actuel avec pwd."
    STEP2="2. Crée un dossier nommé projet 2 dans ton répertoire personnel."
    STEP3="3. Entre dans ce dossier avec cd."
    STEP4="4. Crée deux sous-dossiers : config et bin."
    STEP5="5. Crée un fichier vide nommé readme.txt dans config."
    STEP6="6. Ajoute la chaîne 'Wls4RuCgpltcs9smUa' dans readme.txt."
    STEP7="7. Copie readme.txt de config vers bin sous le nom readme_copy.txt."
    STEP8="8. Copie readme_copy.txt en readme_copy_parent.txt et déplace-le vers le répertoire parent (projet 2)."
    STEP9="9. Supprime le dossier backup situé dans ton répertoire personnel (utilise l'option appropriée pour supprimer les dossiers non vides)."
    STEP10="10. Liste les fichiers dans projet 2 pour vérifier."
    STEP11="11. Crée un lien symbolique nommé lien_vers_readme pointant vers readme_copy_parent.txt."
    STEP12="12. Liste les fichiers avec leurs détails pour vérifier le lien symbolique."
    STEP13="13. Supprime le lien symbolique."
    CHECKING="=== Vérification en cours... ==="

    MSG_OK_CONFIG="✅ Configuration terminée. Le fichier 'OK' a été créé."
    MSG_ALREADY_CONFIGURED="✅ La configuration a déjà été effectuée. Le fichier 'OK' existe."
    MSG_PROJECT_EXISTS="✅ Le dossier 'projet 2' existe."
    MSG_PROJECT_NOT_EXISTS="❌ Erreur : Le dossier 'projet 2' n'existe pas."
    MSG_CONFIG_EXISTS="✅ Le sous-dossier 'config' existe."
    MSG_CONFIG_NOT_EXISTS="❌ Erreur : Le sous-dossier 'config' n'existe pas."
    MSG_BIN_EXISTS="✅ Le sous-dossier 'bin' existe."
    MSG_BIN_NOT_EXISTS="❌ Erreur : Le sous-dossier 'bin' n'existe pas."
    MSG_README_EXISTS="✅ Le fichier 'readme.txt' existe."
    MSG_README_NOT_EXISTS="❌ Erreur : Le fichier 'readme.txt' n'existe pas."
    MSG_README_CONTENT_OK="✅ Le contenu de 'readme.txt' est correct."
    MSG_README_CONTENT_WRONG="❌ Erreur : Le contenu de 'readme.txt' est incorrect."
    MSG_README_COPY_OK="✅ 'readme_copy.txt' existe au bon emplacement."
    MSG_README_COPY_WRONG="❌ Erreur : 'readme_copy.txt' est manquant ou mal placé."
    MSG_README_PARENT_OK="✅ 'readme_copy_parent.txt' a été copié et déplacé vers le répertoire parent."
    MSG_README_PARENT_WRONG="❌ Erreur : 'readme_copy_parent.txt' n'est pas dans le répertoire parent."
    MSG_BACKUP_REMOVED="✅ Le dossier 'backup' a été supprimé avec succès."
    MSG_BACKUP_NOT_REMOVED="❌ Erreur : Le dossier 'backup' existe toujours."
    MSG_SYMLINK_OK="✅ Le lien symbolique 'lien_vers_readme' existe et pointe vers 'readme_copy_parent.txt'."
    MSG_SYMLINK_WRONG="❌ Erreur : Le lien symbolique 'lien_vers_readme' est manquant ou incorrect."
    MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
    MSG_FLAG="🏁 Ton flag : NoFD_{b3c4d5e6}"
fi

# Afficher l'énoncé
echo " "
echo "$TITLE"
echo "$STEP1"
echo "$STEP2"
echo "$STEP3"
echo "$STEP4"
echo "$STEP5"
echo "$STEP6"
echo "$STEP7"
echo "$STEP8"
echo "$STEP9"
echo "$STEP10"
echo "$STEP11"
echo "$STEP12"
echo "$STEP13"
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

PROJECT_DIR="$HOME_DIR/projet 2"
CONFIG_DIR="$PROJECT_DIR/config"
BIN_DIR="$PROJECT_DIR/bin"
BACKUP_DIR="$HOME_DIR/backup"
PASSWORD_FILE="$BACKUP_DIR/password.txt"
README_FILE="$CONFIG_DIR/readme.txt"
README_COPY="$BIN_DIR/readme_copy.txt"
README_COPY_PARENT="$PROJECT_DIR/readme_copy_parent.txt"
SYMLINK="$PROJECT_DIR/lien_vers_readme"
OK_FILE="$HOME_DIR/OK"

# Configuration initiale : Création du dossier backup et du fichier password.txt uniquement si le fichier OK n'existe pas
if [ ! -f "$OK_FILE" ]; then
    echo "⚙️ Configuration en cours : Création du dossier 'backup' et du fichier 'password.txt'..."
    mkdir -p "$BACKUP_DIR"
    touch "$PASSWORD_FILE"
    echo "Le fichier 'password.txt' a été créé dans '$BACKUP_DIR'."
    touch "$OK_FILE"
    echo "$MSG_OK_CONFIG"
else
    echo "$MSG_ALREADY_CONFIGURED"
fi

# Étape 2 : Vérifier si le dossier projet 2 existe
if [ -d "$PROJECT_DIR" ]; then
    echo "$MSG_PROJECT_EXISTS"
else
    echo "$MSG_PROJECT_NOT_EXISTS"
    exit 1
fi

# Étape 4 : Vérifier si les sous-dossiers config et bin existent
if [ -d "$CONFIG_DIR" ]; then
    echo "$MSG_CONFIG_EXISTS"
else
    echo "$MSG_CONFIG_NOT_EXISTS"
    exit 1
fi

if [ -d "$BIN_DIR" ]; then
    echo "$MSG_BIN_EXISTS"
else
    echo "$MSG_BIN_NOT_EXISTS"
    exit 1
fi

# Étape 5 : Vérifier si le fichier readme.txt existe
if [ -f "$README_FILE" ]; then
    echo "$MSG_README_EXISTS"
else
    echo "$MSG_README_NOT_EXISTS"
    exit 1
fi

# Étape 6 : Vérifier le contenu de readme.txt
if grep -Fxq "Wls4RuCgpltcs9smUa" "$README_FILE"; then
    echo "$MSG_README_CONTENT_OK"
else
    echo "$MSG_README_CONTENT_WRONG"
    exit 1
fi

# Étape 7 : Vérifier si readme_copy.txt existe dans bin
if [ -f "$README_COPY" ]; then
    echo "$MSG_README_COPY_OK"
else
    echo "$MSG_README_COPY_WRONG"
    exit 1
fi

# Étape 8 : Vérifier si readme_copy_parent.txt a été copié et déplacé vers le répertoire parent
if [ -f "$README_COPY_PARENT" ]; then
    echo "$MSG_README_PARENT_OK"
else
    echo "$MSG_README_PARENT_WRONG"
    exit 1
fi

# Étape 9 : Vérifier si le dossier backup a été supprimé
if [ ! -d "$BACKUP_DIR" ]; then
    echo "$MSG_BACKUP_REMOVED"
else
    echo "$MSG_BACKUP_NOT_REMOVED"
    exit 1
fi

# Étape 11 : Vérifier si le lien symbolique existe et pointe vers readme_copy_parent.txt
if [ -L "$SYMLINK" ] && [ "$(readlink "$SYMLINK")" = "$README_COPY_PARENT" ]; then
    echo "$MSG_SYMLINK_OK"
else
    echo "$MSG_SYMLINK_WRONG"
    exit 1
fi

# Si tout est correct, afficher le message de succès et le flag
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"