;;; helm --- configure
;;; Commentary:
;; Конфигурация helm

;;; Code:
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-1") 'helm-buffers-list) ;; Список буферов
;; (global-set-key (kbd "M-a") 'helm-M-x) ;; M-x с подсказками
;; (global-set-key (kbd "C-o") 'helm-find-files) ;; Открыть список файлов

(eval-after-load "helm"
  '(progn
     (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)))

;;; helm.el ends here
