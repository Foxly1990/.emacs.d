;;; ido --- configure
;;; Commentary:
;; Подключаем ido

;;; Code:
(require 'ido)
(defun ido-settings()
  "Для настроек ido."
  (ido-mode t)
  (icomplete-mode t)
  (ido-everywhere t)
  (setq ido-vitrual-buffers t)
  (setq ido-enable-flex-matching t))
(ido-settings)

;;; ido.el ends here
