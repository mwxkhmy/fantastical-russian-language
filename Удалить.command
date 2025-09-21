#!/bin/zsh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

FANTASTICAL_APP="/Applications/Fantastical.app"

echo -e "${CYAN}🗑 Удаление русского перевода из Fantastical.app...${RESET}"

if [ ! -d "$FANTASTICAL_APP" ]; then
    echo -e "${RED}❌ Ошибка: Fantastical.app не найден в /Applications!${RESET}"
    echo -e "${YELLOW}Нажмите любую клавишу для выхода...${RESET}"
    read -k1

    osascript -e 'tell application "Terminal" to close front window' & exit
fi

if [ ! -w "$FANTASTICAL_APP/Contents" ]; then
    echo -e "${RED}❌ Нет прав на удаление в $FANTASTICAL_APP.${RESET}"
    echo -e "${YELLOW}ℹ️  Попробуйте запустить скрипт через: sudo $0${RESET}"
    echo -e "${YELLOW}Нажмите любую клавишу для выхода...${RESET}"
    read -k1

    osascript -e 'tell application "Terminal" to close front window' & exit
fi

APP_VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$FANTASTICAL_APP/Contents/Info.plist" 2>/dev/null)
echo -e "${CYAN}📦 Найдена версия Fantastical: ${APP_VERSION}${RESET}"

echo -e "${YELLOW}❓ Вы действительно хотите удалить перевод (ru.lproj)? [y/N]${RESET}"
read -r REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}🚫 Удаление отменено пользователем.${RESET}"
    echo -e "${YELLOW}Нажмите любую клавишу для выхода...${RESET}"
    read -k1

    osascript -e 'tell application "Terminal" to close front window' & exit
fi

echo -e "${YELLOW}⏹️  Завершение Fantastical...${RESET}"
osascript -e 'quit app "Fantastical"' 2>/dev/null || true
sleep 2

echo -e "${YELLOW}⏹️  Завершение Fantastical Helper...${RESET}"
pkill -f "85C27NK92C.com.flexibits.fantastical2.mac.helper" 2>/dev/null || true
pkill -f "/Applications/Fantastical.app/Contents/Library/LoginItems/85C27NK92C.com.flexibits.fantastical2.mac.helper.app/Contents/MacOS/85C27NK92C.com.flexibits.fantastical2.mac.helper" 2>/dev/null || true
sleep 1

remove_if_exists() {
    local target="$1"
    if [ -d "$target" ]; then
        echo -e "${RED} → Удаление:${RESET} $target"
        rm -rf "$target"
    else
        echo -e "${YELLOW} ⚠️ Пропущено:${RESET} $target (не существует)"
    fi
}

remove_if_exists "$FANTASTICAL_APP/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/Library/LoginItems/85C27NK92C.com.flexibits.fantastical2.mac.helper.app/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/PlugIns/DockTile.docktileplugin/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/PlugIns/Fantastical Intents.appex/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/PlugIns/Fantastical Quick Look Extension.appex/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/PlugIns/Fantastical Share Extension.appex/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/PlugIns/Fantastical Widgets.appex/Contents/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/Frameworks/FlexibitsKit.framework/Versions/A/Resources/ru.lproj"
remove_if_exists "$FANTASTICAL_APP/Contents/Frameworks/FantasticalUI.framework/Versions/A/Resources/ru.lproj"

echo -e "${GREEN}✅ Перевод удалён.${RESET}"

echo -e "${GREEN}🎉 Готово! Перевод удалён и язык сброшен по умолчанию.${RESET}"
echo -e "${CYAN}▶️  Запуск Fantastical...${RESET}"
open -a "Fantastical" || echo -e "${YELLOW}⚠️  Не удалось запустить Fantastical автоматически. Попробуйте вручную.${RESET}"

echo -e "${YELLOW}Нажмите любую клавишу для выхода...${RESET}"
read -k1

osascript -e 'tell application "Terminal" to close front window' & exit
