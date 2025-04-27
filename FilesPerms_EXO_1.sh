#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev
# Course Link: 

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: File Permissions and Privileges ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Follow the steps below to complete the exercise:"
        STEP1="1. Create the following users: pablo, alberto, and antonio. Home directories should be created automatically in /home with the default shell /bin/bash. Create a group named 'worker' and add pablo and alberto to it."
        STEP2="2. Create a shared directory named '/shared' that belongs to the 'worker' group with the following permissions: owner with read, write, and execute (rwx), group with read, write, and execute (rwx), others with read and execute (r-x)."
        STEP3="3. Log in as the user 'pablo' and create a file named 'confidential.txt' in '/shared'. The file must belong to the 'worker' group and have the following permissions: owner with read and write (rw-), group with read only (r--), others with no access (---)."
        STEP4="4. Apply the sticky bit on the '/shared' directory so that users can only delete or rename their own files."
        STEP5="5. Download the source file 'secure_task.c' from the URL 'https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/secure_task.c'. Compile this file to generate an executable binary named 'secure_task' in '/usr/local/bin/', owned by 'root' and the 'root' group. Enable the SETUID bit on this file so it runs with root privileges."
        STEP6="6. Perform the following tests: as 'antonio', try to read '/shared/confidential.txt' and save the result (success/failure) in '/var/tmp/confidential_access.txt'. As 'alberto', try to delete '/shared/confidential.txt' (created by pablo) and save the result (success/failure) in '/var/tmp/sticky_bit_test.txt'. As 'antonio', execute 'secure_task' and save the output in '/var/tmp/secure_task_output.txt'."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        PROMPT_CONFIG="Initial configuration is being set up..."

        MSG_USER_CREATED="✅ User '%s' has been created."
        MSG_USER_NOT_CREATED="❌ Error: User '%s' does not exist."
        MSG_GROUP_CREATED="✅ Group 'worker' has been created."
        MSG_GROUP_WRONG="❌ Error: Group 'worker' does not exist."
        MSG_USER_IN_GROUP="✅ User '%s' is in the 'worker' group."
        MSG_USER_NOT_IN_GROUP="❌ Error: User '%s' is not in the 'worker' group."
        MSG_SHARED_PERMS_OK="✅ Directory '/shared' has correct permissions and ownership."
        MSG_SHARED_PERMS_WRONG="❌ Error: Directory '/shared' has incorrect permissions or ownership."
        MSG_CONFIDENTIAL_PERMS_OK="✅ File 'confidential.txt' has correct permissions and ownership."
        MSG_CONFIDENTIAL_PERMS_WRONG="❌ Error: File 'confidential.txt' has incorrect permissions, ownership, or does not exist."
        MSG_STICKY_BIT_OK="✅ Sticky bit is set on '/shared'."
        MSG_STICKY_BIT_WRONG="❌ Error: Sticky bit is not set on '/shared'."
        MSG_SETUID_OK="✅ File 'secure_task' has correct SETUID bit and ownership."
        MSG_SETUID_WRONG="❌ Error: File 'secure_task' does not have correct SETUID bit, ownership, or does not exist."
        MSG_CONFIDENTIAL_ACCESS_OK="✅ Access test for 'confidential.txt' by antonio is correct (should fail)."
        MSG_CONFIDENTIAL_ACCESS_WRONG="❌ Error: Access test for 'confidential.txt' by antonio is incorrect."
        MSG_STICKY_BIT_TEST_OK="✅ Sticky bit test by alberto is correct (should fail to delete)."
        MSG_STICKY_BIT_TEST_WRONG="❌ Error: Sticky bit test by alberto is incorrect."
        MSG_SECURE_TASK_OK="✅ Execution of 'secure_task' by antonio is correct (runs as root)."
        MSG_SECURE_TASK_WRONG="❌ Error: Execution of 'secure_task' by antonio is incorrect."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{file_permissions_privileges}"
    else
        # Messages en français
        TITLE="=== Exercice : Permissions et privilèges des fichiers ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Suivez les étapes ci-dessous pour terminer l'exercice :"
        STEP1="1. Créez les utilisateurs suivants : pablo, alberto et antonio. Les répertoires personnels doivent être créés automatiquement dans /home avec le shell par défaut /bin/bash. Créez un groupe nommé 'worker' et ajoutez-y pablo et alberto."
        STEP2="2. Créez un répertoire partagé nommé '/shared' qui appartient au groupe 'worker' avec les permissions suivantes : propriétaire avec lecture, écriture et exécution (rwx), groupe avec lecture, écriture et exécution (rwx), autres avec lecture et exécution (r-x)."
        STEP3="3. Connectez-vous en tant qu’utilisateur 'pablo' et créez un fichier nommé 'confidential.txt' dans '/shared'. Ce fichier doit appartenir au groupe 'worker' et avoir les permissions suivantes : propriétaire avec lecture et écriture (rw-), groupe avec lecture seule (r--), autres sans accès (---)."
        STEP4="4. Appliquez le sticky bit sur le répertoire '/shared' pour que les utilisateurs ne puissent supprimer ou renommer que leurs propres fichiers."
        STEP5="5. Téléchargez le fichier source 'secure_task.c' depuis l’URL suivante : 'https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/secure_task.c'. Compilez ce fichier pour générer un binaire exécutable nommé 'secure_task' dans '/usr/local/bin/', appartenant à 'root' et au groupe 'root'. Activez le bit SETUID sur ce fichier pour qu’il s’exécute avec les privilèges de root."
        STEP6="6. Effectuez les tests suivants : en tant qu’'antonio', essayez de lire '/shared/confidential.txt' et enregistrez le résultat (succès/échec) dans '/var/tmp/confidential_access.txt'. En tant qu’'alberto', essayez de supprimer '/shared/confidential.txt' (créé par pablo) et enregistrez le résultat (succès/échec) dans '/var/tmp/sticky_bit_test.txt'. En tant qu’'antonio', exécutez 'secure_task' et enregistrez la sortie dans '/var/tmp/secure_task_output.txt'."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        PROMPT_CONFIG="La configuration initiale est en cours..."

        MSG_USER_CREATED="✅ L'utilisateur '%s' a été créé."
        MSG_USER_NOT_CREATED="❌ Erreur : L'utilisateur '%s' n'existe pas."
        MSG_GROUP_CREATED="✅ Le groupe 'worker' a été créé."
        MSG_GROUP_WRONG="❌ Erreur : Le groupe 'worker' n'existe pas."
        MSG_USER_IN_GROUP="✅ L'utilisateur '%s' est dans le groupe 'worker'."
        MSG_USER_NOT_IN_GROUP="❌ Erreur : L'utilisateur '%s' n'est pas dans le groupe 'worker'."
        MSG_SHARED_PERMS_OK="✅ Le répertoire '/shared' a les permissions et propriétaires corrects."
        MSG_SHARED_PERMS_WRONG="❌ Erreur : Le répertoire '/shared' a des permissions ou propriétaires incorrects."
        MSG_CONFIDENTIAL_PERMS_OK="✅ Le fichier 'confidential.txt' a les permissions et propriétaires corrects."
        MSG_CONFIDENTIAL_PERMS_WRONG="❌ Erreur : Le fichier 'confidential.txt' a des permissions, propriétaires incorrects ou n'existe pas."
        MSG_STICKY_BIT_OK="✅ Le sticky bit est activé sur '/shared'."
        MSG_STICKY_BIT_WRONG="❌ Erreur : Le sticky bit n'est pas activé sur '/shared'."
        MSG_SETUID_OK="✅ Le fichier 'secure_task' a le bit SETUID correct et les bons propriétaires."
        MSG_SETUID_WRONG="❌ Erreur : Le fichier 'secure_task' n'a pas le bit SETUID correct, les bons propriétaires ou n'existe pas."
        MSG_CONFIDENTIAL_ACCESS_OK="✅ Le test d'accès à 'confidential.txt' par antonio est correct (doit échouer)."
        MSG_CONFIDENTIAL_ACCESS_WRONG="❌ Erreur : Le test d'accès à 'confidential.txt' par antonio est incorrect."
        MSG_STICKY_BIT_TEST_OK="✅ Le test du sticky bit par alberto est correct (doit échouer à supprimer)."
        MSG_STICKY_BIT_TEST_WRONG="❌ Erreur : Le test du sticky bit par alberto est incorrect."
        MSG_SECURE_TASK_OK="✅ L'exécution de 'secure_task' par antonio est correcte (s'exécute en tant que root)."
        MSG_SECURE_TASK_WRONG="❌ Erreur : L'exécution de 'secure_task' par antonio est incorrecte."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{file_permissions_privileges}"
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

# Vérifier si la langue choisie est valide (strictement 1 ou 2)
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    printf "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English. / Choix invalide. Veuillez sélectionner 1 pour Français ou 2 pour English.\n"
    exit 1
fi

clear

# Définir les messages selon la langue choisie
set_language_messages

# Configuration initiale (exécutée une seule fois)
CONFIG_FILE="/var/tmp/file_permissions_config_done"
if [ ! -f "$CONFIG_FILE" ]; then
    printf "%s\n" "$PROMPT_CONFIG"
    sleep 2
    # Nettoyer les fichiers résiduels
    rm -rf /shared /var/tmp/confidential_access.txt /var/tmp/sticky_bit_test.txt /var/tmp/secure_task_output.txt
    rm -f /usr/local/bin/secure_task
    touch "$CONFIG_FILE"
fi

# Afficher l'énoncé avec espace après le titre
printf "\n"
printf "%s\n" "$TITLE"
printf "%s\n" "$TITLE_SPACE"
printf "%s\n" "$INSTRUCTIONS"
printf "%s\n\n" "$STEP1"
printf "%s\n\n" "$STEP2"
printf "%s\n\n" "$STEP3"
printf "%s\n\n" "$STEP4"
printf "%s\n\n" "$STEP5"
printf "%s\n\n" "$STEP6"

# Donner la possibilité de changer la langue
read -p "$PROMPT_CHANGE_LANG" CHANGE_LANG
if [[ "$CHANGE_LANG" = "1" || "$CHANGE_LANG" = "2" ]]; then
    LANG=$CHANGE_LANG
    set_language_messages
    clear
    printf "\n"
    printf "%s\n" "$TITLE"
    printf "%s\n" "$TITLE_SPACE"
    printf "%s\n" "$INSTRUCTIONS"
    printf "%s\n\n" "$STEP1"
    printf "%s\n\n" "$STEP2"
    printf "%s\n\n" "$STEP3"
    printf "%s\n\n" "$STEP4"
    printf "%s\n\n" "$STEP5"
    printf "%s\n\n" "$STEP6"
fi

# Demander confirmation avant la vérification
read -p "$PROMPT_VERIFY" CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" && "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
    exit 0
fi

printf "\n"
printf "%s\n" "$CHECKING"

# Vérifications des étapes

# Étape 1 : Vérifier la création des utilisateurs et du groupe
for user in pablo alberto antonio; do
    if id "$user" >/dev/null 2>&1; then
        printf "%s\n" "$MSG_USER_CREATED"
    else
        printf "%s\n" "$MSG_USER_NOT_CREATED"
        exit 1
    fi
done

if getent group worker >/dev/null; then
    printf "%s\n" "$MSG_GROUP_CREATED"
else
    printf "%s\n" "$MSG_GROUP_WRONG"
    exit 1
fi

for user in pablo alberto; do
    if groups "$user" | grep -q worker; then
        printf "%s\n" "$MSG_USER_IN_GROUP"
    else
        printf "%s\n" "$MSG_USER_NOT_IN_GROUP"
        exit 1
    fi
done

if groups antonio | grep -q worker; then
    printf "❌ Error: User 'antonio' should not be in the 'worker' group.\n"
    exit 1
fi

# Étape 2 : Vérifier les permissions du répertoire /shared
if [ -d "/shared" ]; then
    perms=$(stat -c '%a' /shared)
    owner=$(stat -c '%U:%G' /shared)
    if [ "$perms" = "775" ] || [ "$perms" = "1775" ] && [ "$owner" = "root:worker" ]; then
        printf "%s\n" "$MSG_SHARED_PERMS_OK"
    else
        printf "%s\n" "$MSG_SHARED_PERMS_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_SHARED_PERMS_WRONG"
    exit 1
fi

# Étape 3 : Vérifier les permissions de confidential.txt
if [ -f "/shared/confidential.txt" ]; then
    perms=$(stat -c '%a' /shared/confidential.txt)
    owner=$(stat -c '%U:%G' /shared/confidential.txt)
    if [ "$perms" = "640" ] && [ "$owner" = "pablo:worker" ]; then
        printf "%s\n" "$MSG_CONFIDENTIAL_PERMS_OK"
    else
        printf "%s\n" "$MSG_CONFIDENTIAL_PERMS_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_CONFIDENTIAL_PERMS_WRONG"
    exit 1
fi

# Étape 4 : Vérifier le sticky bit sur /shared
if [ -d "/shared" ] && [ "$(stat -c '%a' /shared)" = "1775" ]; then
    printf "%s\n" "$MSG_STICKY_BIT_OK"
else
    printf "%s\n" "$MSG_STICKY_BIT_WRONG"
    exit 1
fi

# Étape 5 : Vérifier le SETUID sur secure_task
if [ -f "/usr/local/bin/secure_task" ]; then
    perms=$(stat -c '%a' /usr/local/bin/secure_task)
    owner=$(stat -c '%U:%G' /usr/local/bin/secure_task)
    if [ "$perms" = "4755" ] && [ "$owner" = "root:root" ]; then
        printf "%s\n" "$MSG_SETUID_OK"
    else
        printf "%s\n" "$MSG_SETUID_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_SETUID_WRONG"
    exit 1
fi

# Étape 6 : Vérifier les tests
# Test 1 : Accès à confidential.txt par antonio (doit échouer)
if [ -f "/var/tmp/confidential_access.txt" ]; then
    result=$(cat /var/tmp/confidential_access.txt)
    if [ "$result" = "failure" ]; then
        printf "%s\n" "$MSG_CONFIDENTIAL_ACCESS_OK"
    else
        printf "%s\n" "$MSG_CONFIDENTIAL_ACCESS_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_CONFIDENTIAL_ACCESS_WRONG"
    exit 1
fi

# Test 2 : Suppression de confidential.txt par alberto (doit échouer)
if [ -f "/var/tmp/sticky_bit_test.txt" ]; then
    result=$(cat /var/tmp/sticky_bit_test.txt)
    if [ "$result" = "failure" ] && [ -f "/shared/confidential.txt" ]; then
        printf "%s\n" "$MSG_STICKY_BIT_TEST_OK"
    else
        printf "%s\n" "$MSG_STICKY_BIT_TEST_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_STICKY_BIT_TEST_WRONG"
    exit 1
fi

# Test 3 : Exécution de secure_task par antonio (doit s'exécuter en tant que root)
if [ -f "/var/tmp/secure_task_output.txt" ]; then
    output=$(cat /var/tmp/secure_task_output.txt)
    if [ "$output" = "Running as root" ]; then
        printf "%s\n" "$MSG_SECURE_TASK_OK"
    else
        printf "%s\n" "$MSG_SECURE_TASK_WRONG"
        exit 1
    fi
else
    printf "%s\n" "$MSG_SECURE_TASK_WRONG"
    exit 1
fi

# Supprimer le fichier temporaire de configuration si toutes les étapes sont validées
rm -f "$CONFIG_FILE"

# Message de fin
printf "\n"
printf "%s\n" "$MSG_SUCCESS"
printf "%s\n" "$MSG_FLAG"
