#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: This script is part of an exercise from nofuture.dev
# Course Link: 

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: User Management ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Follow the steps below to complete the exercise:"
        STEP1="1. Create the following users: joe, jack, and avrel. Home directories should be created automatically in /home with the default shell /bin/bash."
        STEP2="2. Create the user 'william' with the following characteristics:\n   - Shell: /bin/sh\n   - Comment: 'William DALTON'\n   - Home directory: /home/william (explicitly created)"
        STEP3="3. Set the password 'azerty' for the user 'avrel'."
        STEP4="4. Log in as the user 'joe' and create the file 'plan_evasion.txt' in their home directory (/home/joe). The file must belong to the user and group 'joe'."
        STEP5="5. Retrieve the GID of the user 'jack' and save it in /var/tmp/jack_gid.txt."
        STEP6="6. Retrieve the encrypted password of the user 'avrel' (from /etc/shadow) and save it in /var/tmp/avrel_password.txt."
        STEP7="7. Add the users joe, jack, avrel, and william to the 'dalton' group."
        STEP8="8. Retrieve the GID of the group 'dalton' and save it in /var/tmp/dalton_gid.txt."
        STEP9="9. The user 'gardian' has a file 'key.txt' in their home directory (/home/gardian). Move this file to /var/tmp."
        STEP10="10. Decode the base64-encoded string in 'key.txt' and save the result in /var/tmp/key_decoded.txt. Hint: Use the command 'base64'."
        STEP11="11. Delete the user 'gardian' along with their home directory in a single command."
        CHECKING="=== Checking in progress... ==="
        PROMPT_VERIFY="Do you want to proceed with the exercise verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        PROMPT_CONFIG="Initial configuration is being set up..."

        MSG_USER_CREATED="✅ User '%s' has been created."
        MSG_USER_NOT_CREATED="❌ Error: User '%s' does not exist."
        MSG_WILLIAM_OK="✅ User 'william' has the correct characteristics."
        MSG_WILLIAM_WRONG="❌ Error: User 'william' does not have the correct characteristics."
        MSG_PASSWORD_OK="✅ Password for 'avrel' is set correctly."
        MSG_PASSWORD_WRONG="❌ Error: Password for 'avrel' is incorrect."
        MSG_FILE_OK="✅ File 'plan_evasion.txt' exists with correct ownership."
        MSG_FILE_WRONG="❌ Error: File 'plan_evasion.txt' does not exist or has incorrect ownership."
        MSG_GID_JACK_OK="✅ GID of 'jack' is correctly saved in 'jack_gid.txt'."
        MSG_GID_JACK_WRONG="❌ Error: GID of 'jack' in 'jack_gid.txt' is incorrect or file does not exist."
        MSG_PASS_AVERL_OK="✅ Encrypted password of 'avrel' is correctly saved in 'avrel_password.txt'."
        MSG_PASS_AVERL_WRONG="❌ Error: Encrypted password of 'avrel' in 'avrel_password.txt' is incorrect or file does not exist."
        MSG_GROUP_OK="✅ User '%s' is in the 'dalton' group."
        MSG_GROUP_WRONG="❌ Error: User '%s' is not in the 'dalton' group."
        MSG_GID_DALTON_OK="✅ GID of 'dalton' group is correctly saved in 'dalton_gid.txt'."
        MSG_GID_DALTON_WRONG="❌ Error: GID of 'dalton' group in 'dalton_gid.txt' is incorrect or file does not exist."
        MSG_KEY_MOVED="✅ File 'key.txt' has been moved to /var/tmp."
        MSG_KEY_NOT_MOVED="❌ Error: File 'key.txt' was not moved to /var/tmp."
        MSG_KEY_DECODED_OK="✅ Content of 'key_decoded.txt' is correct."
        MSG_KEY_DECODED_WRONG="❌ Error: Content of 'key_decoded.txt' is incorrect or file does not exist."
        MSG_GARDIAN_DELETED="✅ User 'gardian' has been deleted."
        MSG_GARDIAN_NOT_DELETED="❌ Error: User 'gardian' was not deleted or home directory still exists."
        MSG_SUCCESS="🎉 Congratulations! All steps are correct."
        MSG_FLAG="🏁 Your flag: NoFD_{user_file_management}"
    else
        # Messages en français
        TITLE="=== Exercice : Gestion des utilisateurs ==="
        TITLE_SPACE=" "
        INSTRUCTIONS="Suivez les étapes ci-dessous pour terminer l'exercice :"
        STEP1="1. Créez les utilisateurs suivants : joe, jack et avrel. Les répertoires personnels doivent être créés automatiquement dans /home avec le shell par défaut /bin/bash."
        STEP2="2. Créez l’utilisateur 'william' avec les caractéristiques suivantes :\n   - Shell : /bin/sh\n   - Commentaire : 'William DALTON'\n   - Répertoire personnel : /home/william (à créer explicitement)"
        STEP3="3. Attribuez le mot de passe 'azerty' à l’utilisateur 'avrel'."
        STEP4="4. Connectez-vous en tant qu’utilisateur 'joe' et créez le fichier 'plan_evasion.txt' dans son répertoire personnel (/home/joe). Assurez-vous que ce fichier appartient à l’utilisateur et au groupe 'joe'."
        STEP5="5. Récupérez le GID (identifiant de groupe) de l’utilisateur 'jack' et enregistrez-le dans le fichier /var/tmp/jack_gid.txt."
        STEP6="6. Récupérez le mot de passe chiffré de l’utilisateur 'avrel' (depuis /etc/shadow) et enregistrez-le dans le fichier /var/tmp/avrel_password.txt."
        STEP7="7. Ajoutez les utilisateurs joe, jack, avrel et william dans le groupe 'dalton'."
        STEP8="8. Récupérez le GID du groupe 'dalton' et enregistrez-le dans le fichier /var/tmp/dalton_gid.txt."
        STEP9="9. L’utilisateur 'gardian' possède un fichier 'key.txt' dans son répertoire personnel (/home/gardian). Déplacez ce fichier vers /var/tmp."
        STEP10="10. Décodez la chaîne présente dans 'key.txt' (encodée en base64) et enregistrez le résultat dans /var/tmp/key_decoded.txt. Indice : Utilisez la commande 'base64'."
        STEP11="11. Supprimez l’utilisateur 'gardian' ainsi que son répertoire personnel en une seule commande."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Voulez-vous procéder à la vérification de l'exercice ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        PROMPT_CONFIG="La configuration initiale est en cours..."

        MSG_USER_CREATED="✅ L'utilisateur '%s' a été créé."
        MSG_USER_NOT_CREATED="❌ Erreur : L'utilisateur '%s' n'existe pas."
        MSG_WILLIAM_OK="✅ L'utilisateur 'william' a les bonnes caractéristiques."
        MSG_WILLIAM_WRONG="❌ Erreur : L'utilisateur 'william' n'a pas les bonnes caractéristiques."
        MSG_PASSWORD_OK="✅ Le mot de passe de 'avrel' est correct."
        MSG_PASSWORD_WRONG="❌ Erreur : Le mot de passe de 'avrel' est incorrect."
        MSG_FILE_OK="✅ Le fichier 'plan_evasion.txt' existe avec les bons propriétaires."
        MSG_FILE_WRONG="❌ Erreur : Le fichier 'plan_evasion.txt' n'existe pas ou a de mauvais propriétaires."
        MSG_GID_JACK_OK="✅ Le GID de 'jack' est correctement enregistré dans 'jack_gid.txt'."
        MSG_GID_JACK_WRONG="❌ Erreur : Le GID de 'jack' dans 'jack_gid.txt' est incorrect ou le fichier n'existe pas."
        MSG_PASS_AVERL_OK="✅ Le mot de passe chiffré de 'avrel' est correctement enregistré dans 'avrel_password.txt'."
        MSG_PASS_AVERL_WRONG="❌ Erreur : Le mot de passe chiffré de 'avrel' dans 'avrel_password.txt' est incorrect ou le fichier n'existe pas."
        MSG_GROUP_OK="✅ L'utilisateur '%s' est dans le groupe 'dalton'."
        MSG_GROUP_WRONG="❌ Erreur : L'utilisateur '%s' n'est pas dans le groupe 'dalton'."
        MSG_GID_DALTON_OK="✅ Le GID du groupe 'dalton' est correctement enregistré dans 'dalton_gid.txt'."
        MSG_GID_DALTON_WRONG="❌ Erreur : Le GID du groupe 'dalton' dans 'dalton_gid.txt' est incorrect ou le fichier n'existe pas."
        MSG_KEY_MOVED="✅ Le fichier 'key.txt' a été déplacé vers /var/tmp."
        MSG_KEY_NOT_MOVED="❌ Erreur : Le fichier 'key.txt' n'a pas été déplacé vers /var/tmp."
        MSG_KEY_DECODED_OK="✅ Le contenu de 'key_decoded.txt' est correct."
        MSG_KEY_DECODED_WRONG="❌ Erreur : Le contenu de 'key_decoded.txt' est incorrect ou le fichier n'existe pas."
        MSG_GARDIAN_DELETED="✅ L'utilisateur 'gardian' a été supprimé."
        MSG_GARDIAN_NOT_DELETED="❌ Erreur : L'utilisateur 'gardian' n'a pas été supprimé ou son répertoire personnel existe encore."
        MSG_SUCCESS="🎉 Félicitations ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Ton flag : NoFD_{user_file_management}"
    fi
}

# Vérifier si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
    echo "❌ Error: This script must be run with sudo."
    echo "❌ Erreur : Ce script doit être exécuté avec sudo."
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
CONFIG_FILE="/var/tmp/user_management_config_done"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "$PROMPT_CONFIG"
    sleep 2
    groupadd dalton 2>/dev/null || true
    useradd -m -s /bin/bash gardian 2>/dev/null || true
    echo "gardian:password" | chpasswd
    echo "VGhlIGtleSBvZiBsaWJlcnR5Cg==" > /home/gardian/key.txt
    chown gardian:gardian /home/gardian/key.txt
    chmod 644 /home/gardian/key.txt
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
echo "$STEP10"
echo "$STEP11"
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
    echo "$STEP11"
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

# Étape 1 : Vérifier la création des utilisateurs joe, jack et avrel
for user in joe jack avrel; do
    if id "$user" >/dev/null 2>&1; then
        printf "$MSG_USER_CREATED\n" "$user"
    else
        printf "$MSG_USER_NOT_CREATED\n" "$user"
        exit 1
    fi
done

# Étape 2 : Vérifier la création de l'utilisateur william avec ses caractéristiques
if id william >/dev/null 2>&1; then
    shell=$(getent passwd william | cut -d: -f7)
    comment=$(getent passwd william | cut -d: -f5)
    home=$(getent passwd william | cut -d: -f6)
    if [ "$shell" = "/bin/sh" ] && [ "$comment" = "William DALTON" ] && [ "$home" = "/home/william" ] && [ -d "/home/william" ]; then
        echo "$MSG_WILLIAM_OK"
    else
        echo "$MSG_WILLIAM_WRONG"
        exit 1
    fi
else
    echo "$MSG_USER_NOT_CREATED" "william"
    exit 1
fi

# Étape 3 : Vérifier le mot de passe de avrel
if echo "azerty" | sudo -S -u avrel true 2>/dev/null; then
    echo "$MSG_PASSWORD_OK"
else
    echo "$MSG_PASSWORD_WRONG"
    exit 1
fi

# Étape 4 : Vérifier le fichier plan_evasion.txt dans /home/joe
if [ -f "/home/joe/plan_evasion.txt" ]; then
    owner=$(stat -c '%U:%G' /home/joe/plan_evasion.txt)
    if [ "$owner" = "joe:joe" ]; then
        echo "$MSG_FILE_OK"
    else
        echo "$MSG_FILE_WRONG"
        exit 1
    fi
else
    echo "$MSG_FILE_WRONG"
    exit 1
fi

# Étape 5 : Vérifier le GID de jack dans /var/tmp/jack_gid.txt
if [ -f "/var/tmp/jack_gid.txt" ]; then
    jack_gid=$(id -g jack)
    file_gid=$(cat /var/tmp/jack_gid.txt)
    if [ "$jack_gid" = "$file_gid" ]; then
        echo "$MSG_GID_JACK_OK"
    else
        echo "$MSG_GID_JACK_WRONG"
        exit 1
    fi
else
    echo "$MSG_GID_JACK_WRONG"
    exit 1
fi

# Étape 6 : Vérifier le mot de passe chiffré de avrel dans /var/tmp/avrel_password.txt
if [ -f "/var/tmp/avrel_password.txt" ]; then
    avrel_pass=$(getent shadow avrel | cut -d: -f2)
    file_pass=$(cat /var/tmp/avrel_password.txt)
    if [ "$avrel_pass" = "$file_pass" ]; then
        echo "$MSG_PASS_AVERL_OK"
    else
        echo "$MSG_PASS_AVERL_WRONG"
        exit 1
    fi
else
    echo "$MSG_PASS_AVERL_WRONG"
    exit 1
fi

# Étape 7 : Vérifier l'appartenance au groupe dalton
for user in joe jack avrel william; do
    if groups "$user" | grep -q dalton; then
        printf "$MSG_GROUP_OK\n" "$user"
    else
        printf "$MSG_GROUP_WRONG\n" "$user"
        exit 1
    fi
done

# Étape 8 : Vérifier le GID du groupe dalton dans /var/tmp/dalton_gid.txt
if [ -f "/var/tmp/dalton_gid.txt" ]; then
    dalton_gid=$(getent group dalton | cut -d: -f3)
    file_gid=$(cat /var/tmp/dalton_gid.txt)
    if [ "$dalton_gid" = "$file_gid" ]; then
        echo "$MSG_GID_DALTON_OK"
    else
        echo "$MSG_GID_DALTON_WRONG"
        exit 1
    fi
else
    echo "$MSG_GID_DALTON_WRONG"
    exit 1
fi

# Étape 9 : Vérifier le déplacement de key.txt vers /var/tmp
if [ -f "/var/tmp/key.txt" ]; then
    echo "$MSG_KEY_MOVED"
else
    echo "$MSG_KEY_NOT_MOVED"
    exit 1
fi

# Étape 10 : Vérifier le contenu de key_decoded.txt
if [ -f "/var/tmp/key_decoded.txt" ]; then
    decoded=$(cat /var/tmp/key_decoded.txt)
    expected="The key of liberty"
    if [ "$decoded" = "$expected" ]; then
        echo "$MSG_KEY_DECODED_OK"
    else
        echo "$MSG_KEY_DECODED_WRONG"
        exit 1
    fi
else
    echo "$MSG_KEY_DECODED_WRONG"
    exit 1
fi

# Étape 11 : Vérifier la suppression de l'utilisateur gardian
if ! id gardian >/dev/null 2>&1 && [ ! -d "/home/gardian" ]; then
    echo "$MSG_GARDIAN_DELETED"
else
    echo "$MSG_GARDIAN_NOT_DELETED"
    exit 1
fi

# Supprimer le fichier temporaire de configuration si toutes les étapes sont validées
rm -f "$CONFIG_FILE"

# Message de fin
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"
