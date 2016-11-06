;;; ergoemacs --- Configuration
;;; Commentary:
;; Stantard ergoemacs-mode config
;;; Code:
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

;; Пустая строка снизу
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

;; Пустая строка сверху
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

;; Пользовательские бинды
(global-set-key (kbd "<f7>") 'kmacro-start-macro) ; Начать запись макроса
(global-set-key (kbd "<f8>") 'kmacro-end-macro) ; Закончить запись макроса
(global-set-key (kbd "<f9>") 'kmacro-end-and-call-macro) ; Вызвать текущий макрос
(define-key global-map (kbd "M-[") 'open-line-above) ; Пустая строка сверху
(define-key global-map (kbd "M-]") 'open-line-below) ; Пустая строка снизу
;;; ergoemacs.el ends here
