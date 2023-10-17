#!/bin/bash

while true; do
    clear
    echo "Интерактивное меню:"
    echo "1. Вывести информацию о текущем пользователе и версии ОС"
    echo "2. Вывести список всех файлов в домашней директории пользователя"
    echo "3. Создать файл в заданной директории с заданными правами"
    echo "4. Отправить 3 пакета с помощью ping на заданный ресурс"
    echo "5. Выйти из скрипта"
    read -p "Выберите опцию (1/2/3/4/5): " option

    case $option in
        1)
            echo "Текущий пользователь: $(whoami)"
            echo "Версия ОС: $(lsb_release -d | awk -F ':\t' '{print $2}')"
            read -p "Нажмите Enter, чтобы продолжить..."
            ;;
        2)
            echo "Список файлов в домашней директории пользователя:"
            ls -la $HOME
            read -p "Нажмите Enter, чтобы продолжить..."
            ;;
        3)
            read -p "Укажите путь к директории: " directory
            read -p "Укажите имя файла: " filename
            read -p "Укажите права доступа для файла (например, 644): " permissions
            touch "$directory/$filename"
            chmod $permissions "$directory/$filename"
            echo "Файл $filename создан в $directory с правами доступа $permissions"
            read -p "Нажмите Enter, чтобы продолжить..."
            ;;
        4)
            read -p "Укажите адрес для ping: " ping_address
            ping -c 3 $ping_address
            read -p "Нажмите Enter, чтобы продолжить..."
            ;;
        5)
            echo "Выход из скрипта."
            exit 0
            ;;
        *)
            echo "Неверный выбор. Пожалуйста, выберите снова."
            read -p "Нажмите Enter, чтобы продолжить..."
            ;;
    esac
done