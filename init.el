;; init.el --- init file
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

;; Установка отсутствующих пакетов
;; Список пакетов, которые участвуют в системе
(require 'package)
(defvar package-list '(js2-mode
                       js2-refactor
                       cider
                       flycheck
                       nodejs-repl
                       tern
                       tern-auto-complete
                       pdf-tools
                       yasnippet
                       autopair
                       paredit
                       web-mode
                       coffee-mode
                       which-key
                       avy
                       sr-speedbar
                       sublime-themes
                       jade-mode
                       clojure-mode
                       lua-mode
                       emmet-mode
                       haskell-mode
                       smex
                       helm
                       elfeed
                       multiple-cursors
                       magit
                       ac-cider
                       ac-nrepl
                       buffer-move
                       auto-complete))

;; Подключаем репозитории
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Иницилизуем пакеты
(package-initialize)

;; Перебираем наш список и из него доустанавливаем пакеты
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Функция объеденения файла в один байт-скомпилированный
(defun compile-config-file (dir &optional dest regexp)
  "Из директории DIR копирует содержимое всех файлов с расширением, чтобы
 точно указать имена файлов используется REGEXP, DEST
указывает путь до файла включая его имя, по-умолчанию это
`~/.emacs.d/compiled.el`, файл создатся автоматически, после
чего будет произведена байт-компиляция и удаление файла, который
был указан в DEST."
  (let ((dest (if dest dest "~/.emacs.d/compiled.el"))
        (regexp (if regexp regexp "\\.el$")))
    (with-temp-file dest
      (mapc #'(lambda (file)
                (let ((file-full (concat dir file)))
                  (insert-file-contents file-full)))
            (directory-files dir nil regexp)))
    (byte-recompile-file dest nil 0)
    (delete-file dest)))

;; (compile-config-file "~/.emacs.d/config/" "~/.emacs.d/compiled/config.el" "\\.el$")

;; Загрузка файлов конфигурации модов
(defun load-directory (dir)
  "DIR путь до директории, которую нужно перебрать.
Функция перебирает все файлы с расширением el и подгружает их."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.elc$"))))

;; Вызываем функцию...
;;(load-file "~/.emacs.d/compiled/config.elc")
(load-directory "~/.emacs.d/compiled")

;; Показать путь до папки с темами
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(defun compile-in-dir (dir)
  "DIR является путём до директории.
Функция переберающая в директории все файлы, которые
имеют расширение `.el` и выполняет байт-компиляцию."
  (let ((compile-it (lambda (f)
                      (byte-compile-file (concat (file-name-as-directory dir) f)))))
    (mapc compile-it (directory-files dir nil "\\.el$"))))

(defun copy-files-to-dir (from to regexp)
  "FROM из директории в TO директорию по REGEXP регулярному выражению."
  (let ((copy-it (lambda (f)
                   (copy-file (concat (file-name-as-directory from) f) (concat (file-name-as-directory to) f)))))
    (mapc copy-it (directory-files from nil regexp))))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3C3836" "#FB4933" "#86C9D3" "#8DD1CA" "#419BB0" "#A59FC0" "#3FD7E5" "#EBDBB2"])
 '(ansi-term-color-vector
   [unspecified "#090300" "#db2d20" "#01a252" "#fded02" "#01a0e4" "#a16a94" "#01a0e4" "#a5a2a2"] t)
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (fogus)))
 '(custom-safe-themes
   (quote
    ("e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "77a46326228485699b378a8537f9bc5d6b0d087566ac179bec752fab322d814a" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "524010e743e264b9a186bb49e696a50473a53ed90d49aff55232af6c12e1ce75" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "4531170141f311250b9e9fbff0aae87415b9bf82bd713d1e92cdae3223276dac" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "2dd32048690787844d8cba601ed3dd8b2f419e9bd985898d0c3792671a05b96b" "954167e51a40f25c34406675eed636eabf7493d8d85e252bfa88ed3efe9ea226" default)))
 '(frame-brackground-mode (quote dark))
 '(linum-format " %1i ")
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(package-selected-packages
   (quote
    (dired+ base16-theme sourcerer-theme creamsody-theme which-key xah-fly-keys haskell-mode zenburn-theme web-mode tern-auto-complete sublime-themes sr-speedbar smex php-auto-yasnippets persistent-soft pdf-tools nodejs-repl magit lua-mode json-mode js2-refactor jade-mode helm gruber-darker-theme flycheck evil-nerd-commenter evil ergoemacs-mode emmet-mode elfeed coffee-mode clojure-snippets cider chess busybee-theme buffer-move avy autopair anti-zenburn-theme afternoon-theme)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(pos-tip-background-color "#1A3734")
 '(pos-tip-foreground-color "#FFFFC8")
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "xos4 Terminus" :foundry "xos4" :slant normal :weight normal :height 105 :width normal)))))
