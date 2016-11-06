;;; org-mode.el --- Configuration
 ;; Author: floki

;;; Commentary:
 ;; configuration for org-mode

;;; Code:
(require 'org-install)
;;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-done t)

;;; org-mode.el ends here
