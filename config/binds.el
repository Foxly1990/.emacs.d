;;; binds --- file with binds
;;; Commentary:
;; My custom binds

;;; Code:
(global-set-key (kbd "C-S-p") 'package-list-packages) ; Вызвать репозиторий
(global-set-key (kbd "C-'") 'avy-goto-char) ; Вызвать avy (easymotion)
(global-set-key (kbd "C-)") 'web-mode) ; Вызвать web-mode
(global-set-key (kbd "C-x t") 'customize-themes) ; Список тем
(global-set-key (kbd "C-c i") 'rcirc) ; Включить irc
(global-set-key (kbd "C-x g") 'webjump) ; Открыть сайт google/wiki английский вариант
(global-set-key (kbd "C-c 1") 'whitespace-mode) ; Показать все пробелы, табуляции, переносы строк
(global-set-key (kbd "C-c 2") 'untabify) ; Преобразовать табуляции в пробелы
(global-set-key (kbd "C-d") 'forward-list) ; К след. скобке
(global-set-key (kbd "C-q") 'backward-list) ; К пред. скобке
;(global-set-key (kbd "M-d") 'backward-delete-char) ; Переназначаем клавишу удаления

;;; binds.el ends here
