;;; emmet --- configure
;;; Commentary:
;; Подключаем emmet-mode

;;; Code:
(require 'emmet-mode)
(eval-after-load "web-mode"
  '(add-hook 'web-mode-hook 'emmet-mode)) ;; web-mode

(add-hook 'html-mode-hook 'emmet-mode) ;; html-mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;;; emmet.el ends here
