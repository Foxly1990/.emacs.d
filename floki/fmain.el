;; =============================================================================
;;                                     MAIN
;; ============================================================================
;; Кодировка файлов
(setq file-name-coding-system 'utf-8)

;; Открыть emacs во весь экран
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Отключает лишние сохранения
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Урезать верхную часть EMACS и полоску скролла
(menu-bar-mode   1)
(tool-bar-mode   -1)
(scroll-bar-mode -1)

;; Убрать экраны приветствия при запуске
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Лучшая отрисовка буфера
(setq redisplay-dont-pause t)

;; Отключить звуковой сигнал
(setq ring-bell-function 'ignore)

;; Общий с ОС буфер обмена
(setq x-select-enable-clipboard t)

;; Время, размер файла в процентах, line-mode
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах

;; Подсветка lisp-выражений
(setq show-paren-style 'expression)
(show-paren-mode 2)

;; Пишем название открытого буфера в шапке
;; (setq frame-title-format "%b")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Табуляция через пробелы
(setq-default indent-tabs-mode nil)

;; Дефолт табуляции
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;;(whitespace-mode 1)

;; Не заставляйте меня печать yes целиком
(fset 'yes-or-no-p 'y-or-n-p)

;; Сохранить сессию
(desktop-save-mode -1)

;; Настройка скролла
(setq scroll-step                 1)
(setq scroll-margin              10)
(setq scroll-conservatively 1000000)

;; Создавать визуальный перенос строк
(setq-default truncate-lines t)

;; Курсор [дефолтное значение 'bar]
;; нижнее подчёрчивание 'hbar
;; заполненный цветом прямоугольник 'box
;; незаполенный цветом прямоугольник 'hollow
;; вертикальная линия 'bar
(setq-default cursor-type 'box)

;; Auto revert buffers
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(provide 'fmain)
