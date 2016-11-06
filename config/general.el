;;; general.el --- common config
;;; Commentary:
;; This is general config for GNU/Emacs
;;; Code:

;; Устанавливаем кодировку
(setq file-name-coding-system 'utf-8)

;; Открыть во весь экран
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Убрать скролл, меню
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Отключить автосохранения
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;; Убрать экран приветствия
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Отключить звуковые сигналы
(setq ring-bell-function 'ignore)

;; Общий с ОС буфер обмена
(setq select-enable-clipboard t)

;; Подсветка скобок
(setq show-paren-style 'expression)
;; (setq show-paren-style 'parenthesis)
;; (setq show-paren-style 'mixed)
(show-paren-mode 1)

;; Нумерация строк
(global-linum-mode 1)

;; Пишем название открытого буфера в шапке
;; (setq frame-title-format "%b")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Табуляция
(setq-default indent-tabs-mode nil) ; табуляция через пробелы
(setq tab-width 2) ; длина табуляции

;; Чтобы не писать yes-no полностью
(fset 'yes-or-no-p 'y-or-n-p)

;; Сохранить сессию -1, 1
(desktop-save-mode -1)

;; Настройка скролла
(setq scroll-set 1)
(setq scroll-margin 10)
(setq scroll-conservatively 1000000)

;; Создавать визуальный перенос строк
(setq-default truncate-lines t)

;; Автообновление буфера
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Автозакрытие скобок, кавычек
(require 'autopair)
(autopair-global-mode t)

;; Подключаем flycheck
(require 'flycheck)
(global-flycheck-mode)

;; Стартовое сообщение в *scratch*
(setq initial-scratch-message
      (propertize (concat
 ";;  ___ __  __   _   ___ ___ \n"
 ";; | __|  \\/  | /_\\ / __/ __|\n"
 ";; | _|| |\\/| |/ _ \\ (__\\__ \\\n"
 ";; |___|_|  |_/_/ \\_\\___|___/\n"
 ";; Приветствую, " (getenv "USER") "! Сегодня "
 (format-time-string "%d.%m.%Y года.")
"\n;; Желаю успеха в новых начинаниях!")) inhibit-startup-screen t)

;;; general.el ends here
