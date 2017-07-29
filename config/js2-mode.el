;;; md-js2-mode --- configure
;;; Commentary:
;; Подключаем javascript IDE

;;; Code:
(require 'js2-mode)
(setq js2-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(require 'nodejs-repl)
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

;; Coffee-script
(require 'coffee-mode)
;; indentation
(custom-set-variables '(coffee-tab-width 2))
;; automatically clean up bad whitespace
(defvar whitespace-action '(auto-cleanup))
;; only show bad whitespace
(defvar whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;;; js2-mode.el ends here
