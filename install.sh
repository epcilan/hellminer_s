#!/bin/bash

nproc=$(nproc --all)

# Установка пакетов
sudo apt-get update -y
sudo apt-get install git screen -y

# Клонирование репозитория
git clone https://github.com/epcilan/hellminer_s.git
cd hellminer_s || exit

# Настройка автозапуска майнера через cron
crontab -l > mycron
echo "@reboot sleep 60 && $HOME/hellminer_s/dotasks.sh" >> mycron
crontab mycron
rm mycron

# Включение cron
sudo systemctl enable cron

# Установка прав на файлы
sudo chmod +x hellminer mine.sh verus-solver

# Запуск майнера в screen
screen -dmS miner bash -c "cd hellminer_s && ./mine.sh >> mine.log 2>&1"
