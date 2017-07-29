;;; general.el --- common config
;;; Commentary:
;; This is general config for GNU/Emacs
;;; Code:

;; Устанавливаем кодировку
(setq file-name-coding-system 'utf-8)

;; Открыть во весь экран
;(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Вести максимально подробный лог
(setq message-log-max t)

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
(defvar show-paren-style 'expression)
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

;; К сохраняемым данным добавляет кодировку с которой использовался буфер
(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)

;; Настройка скролла
(defvar scroll-set 1)
(setq scroll-margin 10)
(setq scroll-conservatively 1000000)

;; Создавать визуальный перенос строк
(setq-default truncate-lines nil)

;; Автообновление буфера
(global-auto-revert-mode t)
(defvar global-auto-revert-non-file-buffers t)
(defvar auto-revert-verbose nil)

;; Автозакрытие скобок, кавычек
;; (require 'autopair)
;; (autopair-global-mode t)

;; Подключаем flycheck
(require 'flycheck)
(global-flycheck-mode)

;; Buffer show
(require 'bs)
(setq bs-configurations
'(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; Sr Speedbar
(require 'sr-speedbar)
(custom-set-variables
 '(speedbar-show-unknown-files t))
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

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
