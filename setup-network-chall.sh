#!/bin/bash

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null
then
    echo "[-] Docker n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
fi

# Vérifier si Docker daemon est actif
if ! systemctl is-active docker | grep -q "active"
then
    echo "[-] Le service Docker n'est pas actif. Démarrez-le avec 'sudo systemctl start docker'"
    exit 1
fi

# xxxxx

if [ "$(id -u)" -ne 0 ]; then
  echo "Ce script doit être exécuté en root"
  exit 1
fi

# Fonction pour nettoyer en cas d'interruption
cleanup() {
    echo -e "\n[!] Interruption détectée. Nettoyage en cours..."
    docker stop host_1 host_2 2>/dev/null
    docker rm host_1 host_2 2>/dev/null
    docker network rm chall-zone 2>/dev/null
    echo "[+] Nettoyage terminé."
    exit 1
}

# Intercepter les signaux (CTRL+C)
trap cleanup INT TERM

# 1. Création des réseaux Docker (avec vérification qu'ils n’existent pas déjà)
echo "[+] Création des réseaux Docker..."

docker network inspect chall-zone &>/dev/null || docker network create chall-zone --subnet=172.66.0.0/16

# 2. Création du container Rocky Linux 9 sur chall-zone
echo "[+] Création du container 'host_1' (Rocky Linux 9)..."
docker inspect host_1 &>/dev/null && docker stop host_1 && docker rm host_1
docker run -d \
  --cap-add=NET_ADMIN \
  --name host_1 \
  --hostname host_1 \
  --network chall-zone \
  --ip 172.66.0.3 \
  rockylinux:9 \
  sleep infinity

# 3. Création du container CentOS 7 SSHD sur chall-zone
echo "[+] Création du container 'host_2' (CentOS 7 SSHD)..."
docker inspect host_2 &>/dev/null && docker stop host_2 && docker rm host_2
docker run -d \
  --cap-add=NET_ADMIN \
  --name host_2 \
  --hostname escalibur-host \
  --network chall-zone \
  --ip 172.66.0.9 \
  fs0ci3ty/centos7-sshd:2 \
  -E /var/log/auth.log

# 4. Purger le contenu de /etc/resolv.conf dans chaque container
echo "[+] Purge du fichier /etc/resolv.conf dans host_1..."
docker exec host_1 sh -c "echo > /etc/resolv.conf"

echo "[+] Purge du fichier /etc/resolv.conf dans host_2..."
docker exec host_2 sh -c "echo > /etc/resolv.conf"

# 5. Ajouter une IP secondaire à host_2
echo "[+] Ajout d'une seconde IP à host_2 (172.66.0.5)..."
docker exec host_2 sh -c "sudo ip addr add 172.66.0.5/32 dev eth0"

# Annexe 1
echo "[+] Add bad thing to host 1"
docker exec host_1 sh -c "ip r add 192.168.9.0/24 dev eth0"
docker exec host_1 sh -c "ip r add 172.66.0.9/32 via 192.168.9.1"

# Désactiver le trap pour éviter un nettoyage intempestif à la fin
trap - INT TERM

# Annexe 2

curl -o ./check https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/check
curl -o ./triage https://raw.githubusercontent.com/N0vachr0n0/NoFD/refs/heads/main/triage
docker cp triage host_2:/home/hunter/
docker cp check host_2:/home/hunter/

echo "[+] Script terminé avec succès."
