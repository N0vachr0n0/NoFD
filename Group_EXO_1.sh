#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev
# Course Link: 

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: Group and Permission Management ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Follow the steps below to complete the exercise:"
        STEP1="1. Create a group named 'akatsuki' with GID 777."
        STEP2="2. Create a group named 'anbu'."
        STEP3="3. Create the following users: pain, nagato, zabuza, and itachi. Home directories should be created automatically in /home with the default shell /bin/bash."
        STEP4="4. Add the users pain and nagato to the 'akatsuki' group."
        STEP5="5. Add the users zabuza and itachi to the 'anbu' group."
        STEP6="6. Retrieve the GID of the 'anbu' group and save it in /var/tmp/anbu_gid.txt."
        STEP7="7. Configure permissions to allow the user 'itachi' to execute the command /usr/bin/touch as the user 'nagato' using sudo."
        STEP8="8. Log in as the user 'itachi' and create the file 'katon.txt' in nagato's home directory (/home/nagato). Ensure itachi has the necessary permissions to write in this directory. (Hint: visudo)"
        STEP9="9. Configure permissions to allow all members of the 'akatsuki' group to execute any command as any user via sudo without entering their password."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        PROMPT_CONFIG="Initial configuration is being set up..."

        MSG_GROUP_AKATSUKI_CREATED="✅ Group 'akatsuki' has been created with GID 777."
        MSG_GROUP_AKATSUKI_WRONG="❌ Error: Group 'akatsuki' does not exist or has incorrect GID."
        MSG_GROUP_ANBU_CREATED="✅ Group 'anbu' has been created."
        MSG_GROUP_ANBU_WRONG="❌ Error: Group 'anbu' does not exist."
        MSG_USER_CREATED="✅ User '%s' has been created."
        MSG_USER_NOT_CREATED="❌ Error: User '%s' does not exist."
        MSG_AKATSUKI_GROUP_OK="✅ User '%s' is in the 'akatsuki' group."
        MSG_AKATSUKI_GROUP_WRONG="❌ Error: User '%s' is not in the 'akatsuki' group."
        MSG_ANBU_GROUP_OK="✅ User '%s' is in the 'anbu' group."
        MSG_ANBU_GROUP_WRONG="❌ Error: User '%s' is not in the 'anbu' group."
        MSG_GID_ANBU_OK="✅ GID of 'anbu' group is correctly saved in 'anbu_gid.txt'."
        MSG_GID_ANBU_WRONG="❌ Error: GID of 'anbu' group in 'anbu_gid.txt' is incorrect or file does not exist."
        MSG_SUDO_ITACHI_OK="✅ User 'itachi' has correct sudo permissions to run 'touch' as 'nagato'."
        MSG_SUDO_ITACHI_WRONG="❌ Error: User 'itachi' does not have correct sudo permissions to run 'touch' as 'nagato'."
        MSG_FILE_OK="✅ File 'katon.txt' exists in /home/nagato."
        MSG_FILE_WRONG="❌ Error: File 'katon.txt' does not exist in /home/nagato."
        MSG_SUDO_AKATSUKI_OK="✅ Group 'akatsuki' has correct sudo permissions (all commands, no password)."
        MSG_SUDO_AKATSUKI_WRONG="❌ Error: Group 'akatsuki' does not have correct sudo permissions."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{group_permission_management}"
    else
        # Messages en français
        TITLE="=== Exercice : Gestion des groupes et permissions ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Suivez les étapes ci-dessous pour terminer l'exercice :"
        STEP1="1. Créez un groupe nommé 'akatsuki' avec le GID 777."
        STEP2="2. Créez un groupe nommé 'anbu'."
        STEP3="3. Créez les utilisateurs suivants : pain, nagato, zabuza et itachi. Les répertoires personnels doivent être créés automatiquement dans /home avec le shell par défaut /bin/bash."
        STEP4="4. Ajoutez les utilisateurs pain et nagato au groupe 'akatsuki'."
        STEP5="5. Ajoutez les utilisateurs zabuza et itachi au groupe 'anbu'."
        STEP6="6. Récupérez le GID du groupe 'anbu' et enregistrez-le dans le fichier /var/tmp/anbu_gid.txt."
        STEP7="7. Configurez les permissions pour permettre à l’utilisateur 'itachi' d’exécuter la commande /usr/bin/touch en tant qu’utilisateur 'nagato' via sudo."
	STEP8="8. Connectez-vous en tant qu’utilisateur 'itachi' et créez le fichier 'katon.txt' dans le répertoire personnel de nagato (/home/nagato). Assurez-vous qu’itachi a les droits nécessaires pour écrire dans ce répertoire. (Indice: visudo)"
        STEP9="9. Configurez les permissions pour permettre à tous les membres du groupe 'akatsuki' d’exécuter toutes les commandes en tant que n’importe quel utilisateur via sudo, sans entrer leur mot de passe."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        PROMPT_CONFIG="La configuration initiale est en cours..."

        MSG_GROUP_AKATSUKI_CREATED="✅ Le groupe 'akatsuki' a été créé avec le GID 777."
        MSG_GROUP_AKATSUKI_WRONG="❌ Erreur : Le groupe 'akatsuki' n'existe pas ou a un GID incorrect."
        MSG_GROUP_ANBU_CREATED="✅ Le groupe 'anbu' a été créé."
        MSG_GROUP_ANBU_WRONG="❌ Erreur : Le groupe 'anbu' n'existe pas."
        MSG_USER_CREATED="✅ L'utilisateur '%s' a été créé."
        MSG_USER_NOT_CREATED="❌ Erreur : L'utilisateur '%s' n'existe pas."
        MSG_AKATSUKI_GROUP_OK="✅ L'utilisateur '%s' est dans le groupe 'akatsuki'."
        MSG_AKATSUKI_GROUP_WRONG="❌ Erreur : L'utilisateur '%s' n'est pas dans le groupe 'akatsuki'."
        MSG_ANBU_GROUP_OK="✅ L'utilisateur '%s' est dans le groupe 'anbu'."
        MSG_ANBU_GROUP_WRONG="❌ Erreur : L'utilisateur '%s' n'est pas dans le groupe 'anbu'."
        MSG_GID_ANBU_OK="✅ Le GID du groupe 'anbu' est correctement enregistré dans 'anbu_gid.txt'."
        MSG_GID_ANBU_WRONG="❌ Erreur : Le GID du groupe 'anbu' dans 'anbu_gid.txt' est incorrect ou le fichier n'existe pas."
        MSG_SUDO_ITACHI_OK="✅ L'utilisateur 'itachi' a les permissions sudo correctes pour exécuter 'touch' en tant que 'nagato'."
        MSG_SUDO_ITACHI_WRONG="❌ Erreur : L'utilisateur 'itachi' n'a pas les permissions sudo correctes pour exécuter 'touch' en tant que 'nagato'."
        MSG_FILE_OK="✅ Le fichier 'katon.txt' existe dans /home/nagato."
        MSG_FILE_WRONG="❌ Erreur : Le fichier 'katon.txt' n'existe pas dans /home/nagato."
        MSG_SUDO_AKATSUKI_OK="✅ Le groupe 'akatsuki' a les permissions sudo correctes (toutes les commandes, sans mot de passe)."
        MSG_SUDO_AKATSUKI_WRONG="❌ Erreur : Le groupe 'akatsuki' n'a pas les permissions sudo correctes."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{group_permission_management}"
    fi
}

# Vérifier si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
    #if [ "$LANG" = "2" ]; then
        echo "❌ Error: This script must be run with sudo."
    #else
        echo "❌ Erreur : Ce script doit être exécuté avec sudo."
    #fi
    exit 1
fi

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

# Configuration initiale (exécutée une seule fois)
CONFIG_FILE="/var/tmp/group_permission_config_done"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "$PROMPT_CONFIG"
    sleep 2
    # Pas de configuration initiale explicite demandée dans cet exercice, mais on peut nettoyer les fichiers résiduels
    rm -f /var/tmp/anbu_gid.txt
    touch "$CONFIG_FILE"
fi

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
    echo " "
fi

# Demander confirmation avant la vérification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

echo " "
echo "$CHECKING"

# Vérifications des étapes

# Étape 1 : Vérifier la création du groupe akatsuki avec GID 777
if getent group akatsuki >/dev/null && [ "$(getent group akatsuki | cut -d: -f3)" = "777" ]; then
    echo "$MSG_GROUP_AKATSUKI_CREATED"
else
    echo "$MSG_GROUP_AKATSUKI_WRONG"
    exit 1
fi

# Étape 2 : Vérifier la création du groupe anbu
if getent group anbu >/dev/null; then
    echo "$MSG_GROUP_ANBU_CREATED"
else
    echo "$MSG_GROUP_ANBU_WRONG"
    exit 1
fi

# Étape 3 : Vérifier la création des utilisateurs pain, nagato, zabuza et itachi
for user in pain nagato zabuza itachi; do
    if id "$user" >/dev/null 2>&1; then
        printf "$MSG_USER_CREATED\n" "$user"
    else
        printf "$MSG_USER_NOT_CREATED\n" "$user"
        exit 1
    fi
done

# Étape 4 : Vérifier l'appartenance au groupe akatsuki
for user in pain nagato; do
    if groups "$user" | grep -q akatsuki; then
        printf "$MSG_AKATSUKI_GROUP_OK\n" "$user"
    else
        printf "$MSG_AKATSUKI_GROUP_WRONG\n" "$user"
        exit 1
    fi
done

# Étape 5 : Vérifier l'appartenance au groupe anbu
for user in zabuza itachi; do
    if groups "$user" | grep -q anbu; then
        printf "$MSG_ANBU_GROUP_OK\n" "$user"
    else
        printf "$MSG_ANBU_GROUP_WRONG\n" "$user"
        exit 1
    fi
done

# Étape 6 : Vérifier le GID du groupe anbu dans /var/tmp/anbu_gid.txt
if [ -f "/var/tmp/anbu_gid.txt" ]; then
    anbu_gid=$(getent group anbu | cut -d: -f3)
    file_gid=$(cat /var/tmp/anbu_gid.txt)
    if [ "$anbu_gid" = "$file_gid" ]; then
        echo "$MSG_GID_ANBU_OK"
    else
        echo "$MSG_GID_ANBU_WRONG"
        exit 1
    fi
else
    echo "$MSG_GID_ANBU_WRONG"
    exit 1
fi

# Étape 7 : Vérifier les permissions sudo d'itachi pour exécuter touch en tant que nagato
if sudo -l -U itachi | egrep  "(nagato)|touch"; then
    echo "$MSG_SUDO_ITACHI_OK"
else
    echo "$MSG_SUDO_ITACHI_WRONG"
    exit 1
fi

# Étape 8 : Vérifier l'existence du fichier katon.txt dans /home/nagato
if [ -f "/home/nagato/katon.txt" ]; then
    echo "$MSG_FILE_OK"
else
    echo "$MSG_FILE_WRONG"
    exit 1
fi

# Étape 9 : Vérifier les permissions sudo du groupe akatsuki
if sudo -l -U pain | grep -q "(ALL) NOPASSWD: ALL"; then
    echo "$MSG_SUDO_AKATSUKI_OK"
else
    echo "$MSG_SUDO_AKATSUKI_WRONG"
    exit 1
fi

# Supprimer le fichier temporaire de configuration si toutes les étapes sont validées
rm -f "$CONFIG_FILE"

# Message de fin
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"
