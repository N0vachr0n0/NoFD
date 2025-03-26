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
    TITLE="=== Exercise 4: System Analysis ==="
    INSTRUCTIONS="Follow the steps below to complete the exercise:"
    STEP1="1. Create a directory named 'projet_4' in your home directory."
    STEP2="2. Create the following files in 'projet_4': ram.txt, swap.txt, cpu.txt, cpu_cmd.txt, version_id.txt, and root_size.txt."
    STEP3="3. Determine the total RAM of your system in MB (e.g., 779) and save it in 'ram.txt'."
    STEP4="4. Determine the total SWAP memory of your system in MB (e.g., 18) and save it in 'swap.txt'."
    STEP5="5. Determine the number of CPUs on your machine. Save the value in 'cpu.txt' using a redirection. Also, save the executed command in 'cpu_cmd.txt' using the absolute path to 'cpu.txt'."
    STEP6="6. Determine the version ID of your Linux distribution (hint: check .release files in /etc/) and save it in 'version_id.txt'."
    STEP7="7. Determine the total size of the root partition ('/') in GB (e.g., 100G) and save it in 'root_size.txt'."
    CHECKING="=== Checking in progress... ==="

    MSG_FILES_CREATED="✅ All required files have been created."
    MSG_PROJECT_NOT_EXISTS="❌ Error: The directory 'projet_4' does not exist."
    MSG_FILE_NOT_EXISTS="❌ Error: The file does not exist."
    MSG_RAM_OK="✅ The RAM value in 'ram.txt' is correct."
    MSG_RAM_WRONG="❌ Error: The RAM value in 'ram.txt' is incorrect."
    MSG_SWAP_OK="✅ The SWAP value in 'swap.txt' is correct."
    MSG_SWAP_WRONG="❌ Error: The SWAP value in 'swap.txt' is incorrect."
    MSG_CPU_OK="✅ The CPU value in 'cpu.txt' is correct."
    MSG_CPU_WRONG="❌ Error: The CPU value in 'cpu.txt' is incorrect."
    MSG_CPU_CMD_OK="✅ The command in 'cpu_cmd.txt' is correct."
    MSG_CPU_CMD_WRONG="❌ Error: The command in 'cpu_cmd.txt' is incorrect."
    MSG_VERSION_ID_OK="✅ The version ID in 'version_id.txt' is correct."
    MSG_VERSION_ID_WRONG="❌ Error: The version ID in 'version_id.txt' is incorrect."
    MSG_ROOT_SIZE_OK="✅ The root size in 'root_size.txt' is correct."
    MSG_ROOT_SIZE_WRONG="❌ Error: The root size in 'root_size.txt' is incorrect."
    MSG_SUCCESS="🎉 Congratulations! All steps of Exercise 4 are correct."
    MSG_FLAG="🏁 Your flag: NoFD_{system_analyzer_4}"
else
    # Messages en français
    TITLE="=== Exercice 4 : Analyse du Système ==="
    INSTRUCTIONS="Suivez les étapes ci-dessous pour terminer l'exercice :"
    STEP1="1. Créez un dossier nommé 'projet_4' dans votre répertoire personnel."
    STEP2="2. Créez les fichiers suivants dans 'projet_4' : ram.txt, swap.txt, cpu.txt, cpu_cmd.txt, version_id.txt et root_size.txt."
    STEP3="3. Déterminez la mémoire RAM totale de votre système en MB (exemple : 779) et insérez-la dans 'ram.txt'."
    STEP4="4. Déterminez la mémoire SWAP totale de votre système en MB (exemple : 18) et insérez-la dans 'swap.txt'."
    STEP5="5. Déterminez le nombre de CPU de votre machine. Insérez la valeur dans 'cpu.txt' en utilisant une redirection. Insérez également la commande exécutée dans 'cpu_cmd.txt' en utilisant le chemin absolu vers 'cpu.txt'."
    STEP6="6. Déterminez l'ID de version de votre distribution Linux (indice : inspectez les fichiers .release dans /etc/) et insérez-la dans 'version_id.txt'."
    STEP7="7. Déterminez la taille totale de la partition racine ('/') en Go (exemple : 100G) et insérez-la dans 'root_size.txt'."
    CHECKING="=== Vérification en cours... ==="

    MSG_FILES_CREATED="✅ Tous les fichiers requis ont été créés."
    MSG_PROJECT_NOT_EXISTS="❌ Erreur : Le dossier 'projet_4' n'existe pas."
    MSG_FILE_NOT_EXISTS="❌ Erreur : Le fichier n'existe pas."
    MSG_RAM_OK="✅ La valeur de la RAM dans 'ram.txt' est correcte."
    MSG_RAM_WRONG="❌ Erreur : La valeur de la RAM dans 'ram.txt' est incorrecte."
    MSG_SWAP_OK="✅ La valeur de la SWAP dans 'swap.txt' est correcte."
    MSG_SWAP_WRONG="❌ Erreur : La valeur de la SWAP dans 'swap.txt' est incorrecte."
    MSG_CPU_OK="✅ La valeur du CPU dans 'cpu.txt' est correcte."
    MSG_CPU_WRONG="❌ Erreur : La valeur du CPU dans 'cpu.txt' est incorrecte."
    MSG_CPU_CMD_OK="✅ La commande dans 'cpu_cmd.txt' est correcte."
    MSG_CPU_CMD_WRONG="❌ Erreur : La commande dans 'cpu_cmd.txt' est incorrecte."
    MSG_VERSION_ID_OK="✅ L'ID de version dans 'version_id.txt' est correct."
    MSG_VERSION_ID_WRONG="❌ Erreur : L'ID de version dans 'version_id.txt' est incorrect."
    MSG_ROOT_SIZE_OK="✅ La taille de la racine dans 'root_size.txt' est correcte."
    MSG_ROOT_SIZE_WRONG="❌ Erreur : La taille de la racine dans 'root_size.txt' est incorrecte."
    MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes de l'exercice 4 sont correctes."
    MSG_FLAG="🏁 Ton flag : NoFD_{system_analyzer_4}"
fi

# Afficher l'énoncé
echo " "
echo "$TITLE"
echo "$INSTRUCTIONS"
echo "$STEP1"
echo "$STEP2"
echo "$STEP3"
echo "$STEP4"
echo "$STEP5"
echo "$STEP6"
echo "$STEP7"
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

PROJECT_DIR="$HOME_DIR/projet_4"
RAM_TXT="$PROJECT_DIR/ram.txt"
SWAP_TXT="$PROJECT_DIR/swap.txt"
CPU_TXT="$PROJECT_DIR/cpu.txt"
CPU_CMD_TXT="$PROJECT_DIR/cpu_cmd.txt"
VERSION_ID_TXT="$PROJECT_DIR/version_id.txt"
ROOT_SIZE_TXT="$PROJECT_DIR/root_size.txt"

# Étape 1-2 : Vérifier que le dossier projet_4 et les fichiers existent
if [ -d "$PROJECT_DIR" ]; then
    echo "$MSG_FILES_CREATED"
else
    echo "$MSG_PROJECT_NOT_EXISTS"
    exit 1
fi

for file in "$RAM_TXT" "$SWAP_TXT" "$CPU_TXT" "$CPU_CMD_TXT" "$VERSION_ID_TXT" "$ROOT_SIZE_TXT"; do
    if [ ! -f "$file" ]; then
        echo "$MSG_FILE_NOT_EXISTS"
        exit 1
    fi
done

# Étape 3 : Vérifier la RAM avec free -m
EXPECTED_RAM=$(free -m | grep Mem: | awk '{print $2}')
ACTUAL_RAM=$(cat "$RAM_TXT")
if [ "$ACTUAL_RAM" = "$EXPECTED_RAM" ]; then
    echo "$MSG_RAM_OK"
else
    echo "$MSG_RAM_WRONG"
    exit 1
fi

# Étape 4 : Vérifier la SWAP avec free -m
EXPECTED_SWAP=$(free -m | grep Swap: | awk '{print $2}')
ACTUAL_SWAP=$(cat "$SWAP_TXT")
if [ "$ACTUAL_SWAP" = "$EXPECTED_SWAP" ]; then
    echo "$MSG_SWAP_OK"
else
    echo "$MSG_SWAP_WRONG"
    exit 1
fi

# Étape 5 : Vérifier le CPU
EXPECTED_CPU=$(nproc)
ACTUAL_CPU=$(cat "$CPU_TXT")
if [ "$ACTUAL_CPU" = "$EXPECTED_CPU" ]; then
    echo "$MSG_CPU_OK"
else
    echo "$MSG_CPU_WRONG"
    exit 1
fi

EXPECTED_CPU_CMD="nproc > $CPU_TXT"
ACTUAL_CPU_CMD=$(cat "$CPU_CMD_TXT")
if [ "$ACTUAL_CPU_CMD" = "$EXPECTED_CPU_CMD" ]; then
    echo "$MSG_CPU_CMD_OK"
else
    echo "$MSG_CPU_CMD_WRONG"
    exit 1
fi

# Étape 6 : Vérifier l'ID de version
EXPECTED_VERSION_ID=$(grep VERSION_ID /etc/os-release | cut -d= -f2 | tr -d '"')
ACTUAL_VERSION_ID=$(cat "$VERSION_ID_TXT")
if [ "$ACTUAL_VERSION_ID" = "$EXPECTED_VERSION_ID" ]; then
    echo "$MSG_VERSION_ID_OK"
else
    echo "$MSG_VERSION_ID_WRONG"
    exit 1
fi

# Étape 7 : Vérifier la taille de la partition racine avec df -h
EXPECTED_ROOT_SIZE=$(df -h / | grep / | awk '{print $2}')
ACTUAL_ROOT_SIZE=$(cat "$ROOT_SIZE_TXT")
if [ "$ACTUAL_ROOT_SIZE" = "$EXPECTED_ROOT_SIZE" ]; then
    echo "$MSG_ROOT_SIZE_OK"
else
    echo "$MSG_ROOT_SIZE_WRONG"
    exit 1
fi

# Si toutes les vérifications passent, afficher le message de succès et le flag
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"