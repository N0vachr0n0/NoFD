#!/bin/bash

# Vérifier si l'utilisateur est root
if [ "$(id -u)" -ne 0 ]; then
  echo "Ce script doit être exécuté en root"
  exit 1
fi

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "[-] Docker n'est pas installé."
    exit 1
fi

echo "[+] Arrêt et suppression des containers..."
docker stop host_1 host_2 &>/dev/null || echo "Containers introuvables ou déjà arrêtés."
docker rm host_1 host_2 &>/dev/null || echo "Containers introuvables ou déjà supprimés."

echo "[+] Suppression du réseau Docker 'chall-zone'..."
docker network rm chall-zone &>/dev/null && echo "[+] Réseau 'chall-zone' supprimé." || echo "Réseau 'chall-zone' introuvable ou déjà supprimé."

echo "[+] Suppression des fichiers téléchargés localement (check, triage)..."
rm -f ./check ./triage &>/dev/null && echo "[+] Fichiers check/triage supprimés." || echo "Aucun fichier check/triage trouvé."

echo "[+] Nettoyage terminé avec succès."
