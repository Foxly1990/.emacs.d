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

;;; js2-mode.el ends here
