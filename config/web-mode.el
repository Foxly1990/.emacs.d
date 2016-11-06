;;; web-mode --- Configuration
;;; Commentary:
;;; Подключаем и настраиваем различные моды

;;; Code:
(require 'web-mode)
;; С какими файлами ассоциировать web-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xsl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; Настройка отступов
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Сниппеты и автозакрытие парных скобок
(setq web-mode-extra-snippets '(("erb" . (("name" . ("beg" . "end"))))))
(setq web-mode-extra-auto-pairs '(("erb" . (("open" "close")))))

;; Подключаем jade-mode
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))

;; css-mode
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;; Подсвечивать текущий элемент
(setq web-mode-enable-current-element-highlight t)

;;; web-mode.el ends here
