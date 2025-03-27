#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev
# Course Link: 

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise 3: Log File Analysis ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Follow the steps below to complete the exercise:"
        STEP1="1. Create a directory named 'projet_3' in your home directory."
        STEP2="2. Create the following files in 'projet_3': first.txt, last.txt, post.txt, safari.txt, req.txt, ip_client.txt, and hour.txt."
        STEP3="3. Download the log file 'access.log' from the terminal using the command: curl -LO https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/access.log"
        STEP4="4. Insert the command to display the first 3 lines of 'access.log' into 'first.txt'."
        STEP5="5. Insert the command to display the last 20 lines of 'access.log' into 'last.txt'."
        STEP6="6. Search for all lines corresponding to a POST request in 'access.log' and insert the command into 'post.txt'."
        STEP7="7. Search for all lines corresponding to requests sent by the Safari browser in 'access.log' and insert the command into 'safari.txt'."
        STEP8="8. Search for all requests sent at 12:16 in 'access.log' and insert the command into 'req.txt'."
        STEP9="9. Extract the IP address of the client who sent a request at 12:14:30 and save it in 'ip_client.txt'."
        STEP10="10. Determine the time when passwords were downloaded (Format: hh:mm:ss) and save it in 'hour.txt'."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "

        MSG_FILES_CREATED="✅ All required files have been created."
        MSG_COMMAND_MATCH="✅ The command in '%s' matches the expected command."
        MSG_COMMAND_MISMATCH="❌ Error: The command in '%s' does not match the expected command."
        MSG_IP_OK="✅ The IP address has been saved in 'ip_client.txt'."
        MSG_IP_WRONG="❌ Error: The IP address in 'ip_client.txt' is incorrect."
        MSG_TIME_OK="✅ The time has been saved in 'hour.txt'."
        MSG_TIME_WRONG="❌ Error: The time in 'hour.txt' is incorrect."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{log_analyzer_3}"
    else
        # Messages en français
        TITLE="=== Exercice 3 : Analyse des Fichiers de Logs ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Suivez les étapes ci-dessous pour terminer l'exercice :"
        STEP1="1. Créez un dossier nommé 'projet_3' dans votre répertoire personnel."
        STEP2="2. Créez les fichiers suivants dans 'projet_3' : first.txt, last.txt, post.txt, safari.txt, req.txt, ip_client.txt et hour.txt."
        STEP3="3. Téléchargez le fichier de logs 'access.log' depuis le terminal en utilisant la commande : curl -LO https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/access.log"
        STEP4="4. Insérez la commande permettant d'afficher les 3 premières lignes de 'access.log' dans 'first.txt'."
        STEP5="5. Insérez la commande permettant d'afficher les 20 dernières lignes de 'access.log' dans 'last.txt'."
        STEP6="6. Recherchez toutes les lignes correspondant à une requête de type POST dans 'access.log' et insérez la commande dans 'post.txt'."
        STEP7="7. Recherchez toutes les lignes correspondant à une requête envoyée par le navigateur Safari dans 'access.log' et insérez la commande dans 'safari.txt'."
        STEP8="8. Recherchez toutes les requêtes envoyées à 12h16 dans 'access.log' et insérez la commande dans 'req.txt'."
        STEP9="9. Extrayez l'adresse IP du client qui a envoyé une requête à 12h 14m 30s et insérez cette adresse IP dans 'ip_client.txt'."
        STEP10="10. Déterminez l'heure à laquelle les mots de passe ont été téléchargés (Format : hh:mm:ss) et insérez l'heure dans 'hour.txt'."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "

        MSG_FILES_CREATED="✅ Tous les fichiers requis ont été créés."
        MSG_COMMAND_MATCH="✅ La commande dans '%s' correspond à la commande attendue."
        MSG_COMMAND_MISMATCH="❌ Erreur : La commande dans '%s' ne correspond pas à la commande attendue."
        MSG_IP_OK="✅ L'adresse IP a été sauvegardée dans 'ip_client.txt'."
        MSG_IP_WRONG="❌ Erreur : L'adresse IP dans 'ip_client.txt' est incorrecte."
        MSG_TIME_OK="✅ L'heure a été sauvegardée dans 'hour.txt'."
        MSG_TIME_WRONG="❌ Erreur : L'heure dans 'hour.txt' est incorrecte."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{log_analyzer_3}"
    fi
}

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
echo "$STEP7"
echo "$STEP8"
echo "$STEP9"
echo "$STEP10"
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
    echo "$STEP7"
    echo "$STEP8"
    echo "$STEP9"
    echo "$STEP10"
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

PROJECT_DIR="$HOME_DIR/projet_3"
LOG_FILE="$PROJECT_DIR/access.log"
FIRST_TXT="$PROJECT_DIR/first.txt"
LAST_TXT="$PROJECT_DIR/last.txt"
POST_TXT="$PROJECT_DIR/post.txt"
SAFARI_TXT="$PROJECT_DIR/safari.txt"
REQ_TXT="$PROJECT_DIR/req.txt"
IP_CLIENT_TXT="$PROJECT_DIR/ip_client.txt"
HOUR_TXT="$PROJECT_DIR/hour.txt"

# Étape 1-2 : Vérifier que le dossier projet_3 et les fichiers existent
if [ -d "$PROJECT_DIR" ]; then
    echo "$MSG_FILES_CREATED"
else
    if [ "$LANG" = "2" ]; then
        echo "❌ Error: The directory 'projet_3' does not exist."
    else
        echo "❌ Erreur : Le dossier 'projet_3' n'existe pas."
    fi
    exit 1
fi

for file in "$FIRST_TXT" "$LAST_TXT" "$POST_TXT" "$SAFARI_TXT" "$REQ_TXT" "$IP_CLIENT_TXT" "$HOUR_TXT"; do
    if [ -f "$file" ]; then
        echo "✅ The file '$(basename "$file")' exists."
    else
        if [ "$LANG" = "2" ]; then
            echo "❌ Error: The file '$(basename "$file")' does not exist."
        else
            echo "❌ Erreur : Le fichier '$(basename "$file")' n'existe pas."
        fi
        exit 1
    fi
done

# Étape 3 : Vérifier que le fichier access.log existe
if [ -f "$LOG_FILE" ]; then
    if [ "$LANG" = "2" ]; then
        echo "✅ The file 'access.log' exists."
    else
        echo "✅ Le fichier 'access.log' existe."
    fi
else
    if [ "$LANG" = "2" ]; then
        echo "❌ Error: The file 'access.log' does not exist."
    else
        echo "❌ Erreur : Le fichier 'access.log' n'existe pas."
    fi
    exit 1
fi

# Fonction pour vérifier la commande exacte
check_command() {
    FILE="$1"
    EXPECTED_COMMAND="$2"
    ACTUAL_COMMAND=$(cat "$FILE")

    if [ "$ACTUAL_COMMAND" = "$EXPECTED_COMMAND" ]; then
        printf "$MSG_COMMAND_MATCH\n" "$(basename "$FILE")"
    else
        printf "$MSG_COMMAND_MISMATCH\n" "$(basename "$FILE")"
        exit 1
    fi
}

# Étape 4 : Vérifier la commande dans first.txt
check_command "$FIRST_TXT" "head -n 3 access.log"

# Étape 5 : Vérifier la commande dans last.txt
check_command "$LAST_TXT" "tail -n 20 access.log"

# Étape 6 : Vérifier la commande dans post.txt
check_command "$POST_TXT" "grep 'POST' access.log"

# Étape 7 : Vérifier la commande dans safari.txt
check_command "$SAFARI_TXT" "grep 'Safari' access.log | grep -v 'Chrome'"

# Étape 8 : Vérifier la commande dans req.txt
check_command "$REQ_TXT" "grep '12:16:' access.log"

# Étape 9 : Vérifier l'adresse IP dans ip_client.txt
if grep -Fxq "192.168.1.25" "$IP_CLIENT_TXT"; then
    echo "$MSG_IP_OK"
else
    echo "$MSG_IP_WRONG"
    exit 1
fi

# Étape 10 : Vérifier l'heure dans hour.txt
if grep -Fxq "12:19:55" "$HOUR_TXT"; then
    echo "$MSG_TIME_OK"
else
    echo "$MSG_TIME_WRONG"
    exit 1
fi

# Message de fin
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"
