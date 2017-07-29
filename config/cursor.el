;;; cursors.el --- settings for cursors
;;; Commentary:
;; Курсор [дефолтное значение 'box]
;; нижнее подчёрчивание 'hbar
;; заполненный цветом прямоугольник 'box
;; незаполенный цветом прямоугольник 'hollow
;; вертикальная линия 'bar

;;; Code:
(defun set-cursor-color-init ()
  "Установить цвет курсора при загрузке основного файла."
  (set-cursor-color "#ffff66")
  (setq-default cursor-type 'box))

(defun th-activate-mark-init ()
  "Интерактивное изменение цвета, при выделении текста."
  (set-cursor-color "#db4437")
  (setq-default cursor-type 'box))

(defun th-deactivate-mark-init ()
  "Интерактивное востановление цвета курсора."
  (set-cursor-color "#ffff66")
  (setq-default cursor-type 'box))

;; Вызов функции после загрузки init.el
(add-hook 'after-init-hook 'set-cursor-color-init)
;; Если режим выделения
(add-hook 'activate-mark-hook 'th-activate-mark-init)
;; Если режим выделения не активен
(add-hook 'deactivate-mark-hook 'th-deactivate-mark-init)

;; Множественные курсоры
(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
;;; cursor.el ends here
