;; =============================================================================
;;                                 REQUIRE
;; =============================================================================
;; Подключаем melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Ergoemacs mode
;;(require 'ergoemacs-mode)
;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 1)

;; Nyan Cat mode
(require 'nyan-mode)
(nyan-mode 1)

;; Подключаем bs
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; Подключаем ido
(require 'ido)
(defun ido-settings()
  (ido-mode                      t)
  (icomplete-mode                t)
  (ido-everywhere                t)
  (setq ido-vitrual-buffers      t)
  (setq ido-enable-flex-matching t))
(ido-settings)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Бинды vim
(eval-after-load "evil"
  '(progn
     (setq evil-default-cursor '("yellow" hbar))
     (setq evil-normal-state-cursor '("yellow" hbar))
     (setq evil-insert-state-cursor '("yellow" bar))
     (setq evil-visual-state-cursor '("yellow" box))))
(require 'evil)
(evil-mode 1)

;; Подключаем linum
(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;; Подключаем tramp
(setq ange-ftp-try-passive-mode t)
(setq ange-ftp-passive-host-alist nil)
(setq tramp-default-method "ftp")
(require 'tramp)

;; Подключаем yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Подключаем web-mode
(require 'web-mode)
;; С какими файлами ассциировать web-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xsl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; Настройка отступов
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
;; Сниппеты и автозакрытие парных скобок
(setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))))
(setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))))
;; Подсвечивать текущий элемент
(setq web-mode-enable-current-element-highlight t)
;; Подключаем emmet-mode
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; Подключаем javascript IDE
(require 'js2-mode)
(setq js2-basic-offset 4)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Подключаем clojure-mode
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

;; Состояния TODO в org-mode
(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

;; Автоматическое добавление скобок и ковычек
(require 'autopair)
(autopair-global-mode -1) ;; чтобы глобально вызвать вводим t

;; После загрузки dired подключить бинды к нему
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "w" 'dired-jump)))
(require 'dired)

;; Подключаем ace-jump-mode
(eval-after-load "ace-jump-mode"
'(progn (define-key global-map (kbd "C-;") 'ace-jump-mode)))
(require 'ace-jump-mode)

;; Найти функцию в lisp
(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f7>") 'imenu) ;; вызов Imenu на F6

;; CEDET
(require 'cedet) ;; использую "вшитую" версию CEDET
(add-to-list 'semantic-default-submodes '(global-semanticdb-minor-mode
                                          global-semantic-mru-bookmark-mode
                                          global-semantic-idle-scheduler-mode
                                          global-semantic-highlight-func-mode
                                          global-semantic-idle-completions-mode
                                          global-semantic-show-parser-state-mode))
(semantic-mode   t)
(global-ede-mode t)
(require 'ede/generic)
(require 'semantic/ia)
(ede-enable-generic-projects)

;; Настраиваем автокомплит
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start        t)
    (setq ac-auto-show-menu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes '(lisp-mode js2-mode web-mode))
    (add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
    (add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
    (add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
    (add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
    (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
    (add-to-list 'ac-sources 'ac-source-files-in-current-dir))
(ac-init)
(provide 'fincludes)
