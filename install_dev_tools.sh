#!/usr/bin/env bash
set -e

echo "Оновлення списку пакетів..."
sudo apt-get update -y

# 1. Docker
if command -v docker &> /dev/null; then
    echo "Docker вже встановлено: $(docker --version)"
else
    echo "Встановлення Docker..."
    sudo apt-get install -y docker.io
    sudo systemctl enable --now docker
fi

# 2. Docker Compose
if docker compose version &> /dev/null || command -v docker-compose &> /dev/null; then
    echo "Docker Compose вже встановлено."
else
    echo "Встановлення Docker Compose..."
    sudo apt-get install -y docker-compose-plugin || sudo apt-get install -y docker-compose
fi

# 3. Python
if command -v python3 &> /dev/null; then
    echo "Python вже встановлено: $(python3 --version)"
else
    echo "Встановлення Python..."
    sudo apt-get install -y python3 python3-pip
fi

# 4. Django
if python3 -m django --version &> /dev/null; then
    echo "Django вже встановлено: $(python3 -m django --version)"
else
    echo "Встановлення Django..."
    sudo apt-get install -y python3-django
fi

echo "Усі інструменти перевірено та встановлено!"