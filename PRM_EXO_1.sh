#!/bin/bash

# GitHub Repository: https://github.com/N0vachr0n0/NoFD
# Description: Exercise to analyze Linux processes

# Fonction pour nettoyer les processus en arrière-plan
cleanup() {
    if [ ! -z "$SLEEP_PID" ]; then
        kill $SLEEP_PID 2>/dev/null
    fi
}

# Capturer les interruptions pour nettoyer
trap cleanup EXIT

# Fonction pour définir les messages selon la langue
set_language_messages() {
    if [ "$LANG" = "2" ]; then
        # Messages en anglais
        TITLE="=== Exercise: Linux Process Analysis ==="
        TITLE_SPACE=" "
        SETUP_MSG="⚙️ Please run 'python3 boom.py & disown' in another terminal to simulate a load."
        SETUP_FAIL="❌ Error: 'python3 boom.py' is not running. Please run 'python3 boom.py & disown' and try again."
        STEP1="1. Create a directory named 'process_project'."
        STEP2="2. Identify the command executed by the process with PID 1. Save it in 'cmd_1.txt'."
        STEP3="3. Identify the user who executed the process with PID 1. Save it in 'user.txt'."
        STEP4="4. Find the PPID of the process consuming the most resources. Save it in 'cpu_ppid.txt'."
        STEP5="5. Find the PID of the process running 'python3 boom.py'. Save it in 'boom_pid.txt'."
        STEP6="6. Count the number of processes associated with the 'syslog' user. Save it in 'syslog.txt'."
        CHECKING="=== Verification in progress... ==="
        PROMPT_VERIFY="Proceed with verification? (y/n): "
        PROMPT_CHANGE_LANG="Change language? (1: Français, 2: English, any key to continue): "
        
        MSG_OK_CONFIG="✅ Environment setup completed."
        MSG_PROJECT_EXISTS="✅ Directory 'process_project' exists."
        MSG_PROJECT_NOT_EXISTS="❌ Error: Directory 'process_project' does not exist."
        MSG_CMD1_OK="✅ 'cmd_1.txt' contains the correct command for PID 1."
        MSG_CMD1_WRONG="❌ Error: 'cmd_1.txt' is missing or incorrect."
        MSG_USER_OK="✅ 'user.txt' contains the correct user for PID 1."
        MSG_USER_WRONG="❌ Error: 'user.txt' is missing or incorrect."
        MSG_CPU_PPID_OK="✅ 'cpu_ppid.txt' contains the correct PPID for highest resource usage."
        MSG_CPU_PPID_WRONG="❌ Error: 'cpu_ppid.txt' is missing or incorrect."
        MSG_BOOM_PID_OK="✅ 'boom_pid.txt' contains the correct PID for 'python3 boom.py'."
        MSG_BOOM_PID_WRONG="❌ Error: 'boom_pid.txt' is missing or incorrect."
        MSG_SYSLOG_OK="✅ 'syslog.txt' contains the correct number of 'syslog' processes."
        MSG_SYSLOG_WRONG="❌ Error: 'syslog.txt' is missing or incorrect."
        MSG_SUCCESS="🎉 Success! All steps completed correctly."
        MSG_FLAG="🏁 Flag: NoFD_{pr0c3ss_4n4lys1s}"
    else
        # Messages en français
        TITLE="=== Exercice : Analyse des Processus Linux ==="
        TITLE_SPACE=" "
        SETUP_MSG="⚙️ Veuillez exécuter 'python3 boom.py & disown' dans un autre terminal pour simuler une charge."
        SETUP_FAIL="❌ Erreur : 'python3 boom.py' n'est pas en cours d'exécution. Veuillez exécuter 'python3 boom.py & disown' et réessayer."
        STEP1="1. Créez un répertoire nommé 'process_project'."
        STEP2="2. Identifiez la commande exécutée par le processus avec le PID 1. Enregistrez-la dans 'cmd_1.txt'."
        STEP3="3. Identifiez l'utilisateur ayant exécuté le processus avec le PID 1. Enregistrez-le dans 'user.txt'."
        STEP4="4. Trouvez le PPID du processus consommant le plus de ressources. Enregistrez-le dans 'cpu_ppid.txt'."
        STEP5="5. Trouvez le PID du processus exécutant 'python3 boom.py'. Enregistrez-le dans 'boom_pid.txt'."
        STEP6="6. Comptez le nombre de processus associés à l'utilisateur 'syslog'. Enregistrez-le dans 'syslog.txt'."
        CHECKING="=== Vérification en cours... ==="
        PROMPT_VERIFY="Procéder à la vérification ? (o/n) : "
        PROMPT_CHANGE_LANG="Changer la langue ? (1: Français, 2: English, autre touche pour continuer) : "
        
        MSG_OK_CONFIG="✅ Configuration de l'environnement terminée."
        MSG_PROJECT_EXISTS="✅ Le répertoire 'process_project' existe."
        MSG_PROJECT_NOT_EXISTS="❌ Erreur : Le répertoire 'process_project' n'existe pas."
        MSG_CMD1_OK="✅ 'cmd_1.txt' contient la commande correcte pour le PID 1."
        MSG_CMD1_WRONG="❌ Erreur : 'cmd_1.txt' est manquant ou incorrect."
        MSG_USER_OK="✅ 'user.txt' contient l'utilisateur correct pour le PID 1."
        MSG_USER_WRONG="❌ Erreur : 'user.txt' est manquant ou incorrect."
        MSG_CPU_PPID_OK="✅ 'cpu_ppid.txt' contient le PPID correct pour l'utilisation maximale des ressources."
        MSG_CPU_PPID_WRONG="❌ Erreur : 'cpu_ppid.txt' est manquant ou incorrect."
        MSG_BOOM_PID_OK="✅ 'boom_pid.txt' contient le PID correct pour 'python3 boom.py'."
        MSG_BOOM_PID_WRONG="❌ Erreur : 'boom_pid.txt' est manquant ou incorrect."
        MSG_SYSLOG_OK="✅ 'syslog.txt' contient le nombre correct de processus 'syslog'."
        MSG_SYSLOG_WRONG="❌ Erreur : 'syslog.txt' est manquant ou incorrect."
        MSG_SUCCESS="🎉 Succès ! Toutes les étapes sont correctes."
        MSG_FLAG="🏁 Flag : NoFD_{pr0c3ss_4n4lys1s}"
    fi
}

# Choix initial de la langue
echo "Choose your language / Choisissez votre langue :"
echo "1. Français"
echo "2. English"
read -p "Enter 1 or 2 / Entrez 1 ou 2 : " LANG

# Vérifier si la langue choisie est valide
if [ "$LANG" != "1" ] && [ "$LANG" != "2" ]; then
    echo "❌ Error / Erreur : Invalid choice. Please select 1 for Français or 2 for English."
    exit 1
fi

# Définir les messages selon la langue choisie
set_language_messages

# Récupérer le répertoire personnel
USER=$(whoami)
if [ "$USER" = "root" ]; then
    HOME_DIR="/root"
else
    HOME_DIR="/home/$USER"
fi

# Créer le script Python boom.py
cat << 'EOF' > "$HOME_DIR/boom.py"
import math

while True:
    math.sqrt(12345.6789)
EOF
chmod +x "$HOME_DIR/boom.py"

# Vérifier si python3 boom.py est en cours d'exécution
BOOM_PID=$(ps -C python3 -o pid,cmd | grep "boom.py" | awk '{print $1}' | head -n 1)
if [ -z "$BOOM_PID" ]; then
    echo "$SETUP_MSG"
    # Attendre que l'utilisateur lance boom.py
    while [ -z "$BOOM_PID" ]; do
        sleep 1
        BOOM_PID=$(ps -C python3 -o pid,cmd | grep "boom.py" | awk '{print $1}' | head -n 1)
    done
fi

# Créer et lancer le script Bash avec sleep 3600
cat << 'EOF' > "$HOME_DIR/sleep.sh"
#!/bin/bash
sleep 3600
EOF
chmod +x "$HOME_DIR/sleep.sh"
"$HOME_DIR/sleep.sh" &
SLEEP_PID=$!

# Afficher le message de configuration terminée
echo "$MSG_OK_CONFIG"
sleep 2

clear

# Afficher l'énoncé
echo " "
echo "$TITLE"
echo "$TITLE_SPACE"
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
    cleanup
    exit 0
fi

echo " "
echo "$CHECKING"

# Définir les chemins pour les vérifications
PROJECT_DIR="$HOME_DIR/process_project"
CMD1_FILE="$PROJECT_DIR/cmd_1.txt"
USER_FILE="$PROJECT_DIR/user.txt"
CPU_PPID_FILE="$PROJECT_DIR/cpu_ppid.txt"
BOOM_PID_FILE="$PROJECT_DIR/boom_pid.txt"
SYSLOG_FILE="$PROJECT_DIR/syslog.txt"

# Vérifications strictes des étapes
[ -d "$PROJECT_DIR" ] && echo "$MSG_PROJECT_EXISTS" || { echo "$MSG_PROJECT_NOT_EXISTS"; cleanup; exit 1; }

# Vérification de la commande du PID 1
CMD1=$(ps -p 1 -o cmd --no-headers | tr -s ' ')
[ -f "$CMD1_FILE" ] && [ "$(cat "$CMD1_FILE" | tr -d '\n')" = "$CMD1" ] && echo "$MSG_CMD1_OK" || { echo "$MSG_CMD1_WRONG"; cleanup; exit 1; }

# Vérification de l'utilisateur du PID 1
USER1=$(ps -p 1 -o user --no-headers | tr -s ' ')
[ -f "$USER_FILE" ] && [ "$(cat "$USER_FILE" | tr -d '\n')" = "$USER1" ] && echo "$MSG_USER_OK" || { echo "$MSG_USER_WRONG"; cleanup; exit 1; }

# Vérification du PPID du processus consommant le plus de ressources
CPU_PID=$(ps -eo pid,%cpu --sort=-%cpu | head -n 2 | tail -n 1 | awk '{print $1}')
CPU_PPID=$(ps -p $CPU_PID -o ppid --no-headers | tr -s ' ')
[ -f "$CPU_PPID_FILE" ] && [ "$(cat "$CPU_PPID_FILE" | tr -d '\n')" = "$CPU_PPID" ] && echo "$MSG_CPU_PPID_OK" || { echo "$MSG_CPU_PPID_WRONG"; cleanup; exit 1; }

# Vérification du PID de python3 boom.py
[ -f "$BOOM_PID_FILE" ] && [ "$(cat "$BOOM_PID_FILE" | tr -d '\n')" = "$BOOM_PID" ] && echo "$MSG_BOOM_PID_OK" || { echo "$MSG_BOOM_PID_WRONG"; cleanup; exit 1; }

# Vérification du nombre de processus syslog
SYSLOG_COUNT=$(ps -U syslog -u syslog | wc -l)
[ -f "$SYSLOG_FILE" ] && [ "$(cat "$SYSLOG_FILE" | tr -d '\n')" = "$SYSLOG_COUNT" ] && echo "$MSG_SYSLOG_OK" || { echo "$MSG_SYSLOG_WRONG"; cleanup; exit 1; }

# Afficher le message de succès et le flag
echo " "
echo "$MSG_SUCCESS"
echo "$MSG_FLAG"