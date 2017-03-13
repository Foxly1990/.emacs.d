;;; init.el --- init file
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

;; Установка отсутствующих пакетов
;; Список пакетов, которые участвуют в системе
(defvar package-list '(ergoiemacs-mode
                       cider
                       flycheck
                       js2-mode
                       js2-refactor
                       tern
                       tern-auto-complete
                       pdf-tools
                       yasnippet
                       autopair
                       web-mode
                       chess
                       jade-mode
                       emmet-mode
                       smex
                       helm
                       elfeed
                       magit
                       auto-complete))

;; Подключаем репозитории
(defvar package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Иницилизуем пакеты
(package-initialize)

;; Поверяем наличие установленные пакеты
(unless package-archive-contents
  (package-refresh-contents))

;; Перебираем наш список и из него доустанавливаем пакеты
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Загрузка файлов конфигурации модов
(defun load-directory (dir)
  "DIR путь до директории, которую нужно перебрать.
Функция перебирает все файлы с расширением el и подгружает их."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))
                 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

;; Вызываем функцию...
(load-directory "~/.emacs.d/config")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (pdf-tools paperless persistent-soft)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

;;; init.el ends here
