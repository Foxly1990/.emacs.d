;;; binds --- file with binds
;;; Commentary:
;; My custom binds

;;; Code:


;;=====================
;; Функции пользователя
;;=====================

;; Пустая строка снизу
(defun open-line-below ()
  "Open line below."
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

;; Пустая строка сверху
(defun open-line-above ()
  "Open line above."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

;;=================
;; Назначенные клавиши
;;=================

;; передвижение курсора
(global-set-key (kbd "M-i") 'previous-line) ; на предыдущую строка
(global-set-key (kbd "M-l") 'forward-char) ; на символ вперёд
(global-set-key (kbd "M-k") 'next-line) ; на следующую строку
(global-set-key (kbd "M-j") 'backward-char) ; на символ назад
(global-set-key (kbd "M-o") 'forward-word) ; на слово вперёд
(global-set-key (kbd "M-u") 'backward-word) ; на слово назад

;; буфер
(global-set-key (kbd "M-n") 'beginning-of-buffer) ; в начало буфера
(global-set-key (kbd "M-N") 'end-of-buffer) ; в конец буфера

;; окна
(global-set-key (kbd "M-1") 'delete-window) ; удалить текущее окно
(global-set-key (kbd "M-2") 'delete-other-windows) ; удалить все окна
(global-set-key (kbd "M-3") 'split-window-below) ; разделить по горизонтале
(global-set-key (kbd "M-4") 'split-window-right) ; разделить по вертикали
(global-set-key (kbd "M-w") 'other-window) ; разделить по вертикали

;; строки
(global-set-key (kbd "M-[") 'open-line-above) ; Пустая строка сверху
(global-set-key (kbd "M-]") 'open-line-below) ; Пустая строка снизу
(global-set-key (kbd "M-h") 'move-beginning-of-line) ; к началу строки
(global-set-key (kbd "M-H") 'move-end-of-line) ; в конец строки

;; удаление
(global-set-key (kbd "M-d") 'backward-delete-char-untabify) ; удалить символ назад
(global-set-key (kbd "M-f") 'delete-char) ; удалить символ вперёд
(global-set-key (kbd "M-e") 'backward-kill-word) ; удалить слово назад
(global-set-key (kbd "M-r") 'kill-word) ; удалить слово вперёд
(global-set-key (kbd "M-g") 'kill-line) ; удалить всё справа от курсора

;; копировать/вставить/вырезать
(global-set-key (kbd "M-v") 'yank) ; вставить
(global-set-key (kbd "M-c") 'kill-ring-save) ; копировать

;; undo/redo
(global-set-key (kbd "C-z") 'undo)

;; выделение
(global-set-key (kbd "M-SPC") 'set-mark-command) ; начать выделение
(global-set-key (kbd "C-a") 'mark-whole-buffer) ; выделить весь буфер

;; файловая система
(global-set-key (kbd "C-o") 'dired-jump)

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
;;(global-set-key (kbd "C-x C-f") 'sudo-edit) ; Редактировать файлы как root
(global-set-key (kbd "C-1") 'bs-show) ; Показать список буферов
(global-set-key (kbd "C-c C-d") 'kill-sexp)
;; (define-key cider-mode-map (kbd "C-c e") 'cider-eval-buffer) ; Заэвалить буфер в cider-mode
;; (global-set-key (kbd "<f12>") 'sr-speedbar-toggle) ; Вызвать список файлов (sr-speedbar)
;; Переназначаем клавишу удаления
;; (global-unset-key (kbd "M-d"))
;; (global-set-key (kbd "M-d") 'autopair-backspace)
;;; binds.el ends here
