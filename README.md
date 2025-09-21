
# 🇷🇺 Fantastical-Translate

Небольшой проект, который добавляет **русскую локализацию** в [Fantastical](https://flexibits.com/fantastical) на macOS.  
Поддерживаются как **Intel**, так и **Apple Silicon (M1/M2/...)** системы.  

---

## ✨ Что это такое?
По умолчанию Fantastical не имеет перевода на русский язык.  
Этот скрипт автоматически копирует перевод `ru.lproj` в саму программу и запускает её заново.  

- ⚡️ Установка занимает всего несколько секунд 
- 🔄 В любой момент можно удалить локализацию  
- 💙 Перевод выполнен на 99,9%

---

## 📥 Как установить
1. Скачайте последнюю версию перевода (Fantastical-Translate) из раздела [Releases](https://github.com/mwxkhmy/fantastical-russian-language/releases) этого репозитория.

2. Запустите установку:

   * двойным кликом по `Установить.command`
   * или через терминал в папке со скриптом:

     ```bash
     ./Установить.command
     ```

3. Fantastical автоматически перезапустится уже с русским интерфейсом. 🎉

> * ‼️ **Для работы перевода ваша система должна быть на русском языке!**

---

## ❌ Как удалить перевод

Если захотите вернуть интерфейс — запустите:

```bash
./Удалить.command
```

Программа перезапустится, и локализация будет убрана.

---

## ⚠️ Gatekeeper и запуск скриптов

macOS защищает систему и может показать предупреждение вида
*«Не удаётся проверить разработчика»* при первом запуске скрипта.

Есть несколько способов запустить файл:

* Правый клик → **Открыть** → подтвердить запуск.  
* В **Системные настройки → Конфиденциальность и безопасность** нажать **Разрешить всё равно**.  
* Запустить из Терминала вручную:
  ```bash
  ./Установить.command
  ```

> 📝 Подобное предупреждение выводится только один раз для каждого файла.

---

## 📂 Где искать Fantastical

Обычно программа устанавливается в:

* `/Applications/Fantastical.app`
* или `~/Applications/Fantastical.app` (если ставили через Homebrew только для текущего пользователя).

Если приложение не найдено, просто переместите его в одну из этих папок.

---

## 🗑 Ручное удаление

Если скрипт недоступен или вы хотите всё сделать вручную, выполните:

```bash
rm -rf \
"/Applications/Fantastical.app/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/Library/LoginItems/85C27NK92C.com.flexibits.fantastical2.mac.helper.app/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/PlugIns/DockTile.docktileplugin/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/PlugIns/Fantastical Intents.appex/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/PlugIns/Fantastical Quick Look Extension.appex/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/PlugIns/Fantastical Share Extension.appex/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/PlugIns/Fantastical Widgets.appex/Contents/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/Frameworks/FlexibitsKit.framework/Versions/A/Resources/ru.lproj" \
"/Applications/Fantastical.app/Contents/Frameworks/FantasticalUI.framework/Versions/A/Resources/ru.lproj"
```

---

## ℹ️ Дополнительно

* Скрипт работает только с папкой `ru.lproj` — другие локализации не затрагиваются.
* Если что-то пошло не так, удалите `ru.lproj` вручную (см. выше).

---

## ❤️ Благодарность

Спасибо, что пользуетесь проектом!
Если нашли ошибки или хотите предложить улучшение — создайте [Issue](https://github.com/mwxkhmy/fantastical-russian-language/issues)
