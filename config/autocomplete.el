;;; autocomplete --- configuration
;;; Commentary:
;; Conf file
;;; Code:

;; Автодополнение для elisp
(require 'auto-complete)
(ac-config-default)

;; Автодополнение для js2-mode
(require 'tern)
(require 'tern-auto-complete)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;;(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(setq ac-js2-evaluate-calls t)

;;; autocomplete.el ends here
