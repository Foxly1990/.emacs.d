;; =============================================================================
;;                                 KEYBINDINGS
;; =============================================================================
(defun my-keybindings()
  (define-key global-map (kbd "C-0") 'neotree-toggle) ;; Показать дерево файлов
  (define-key global-map (kbd "C-1") 'bs-show) ;; Показать список буферов
  (define-key global-map (kbd "C-S-p") 'package-list-packages) ;; Открыть лист пакетов
  (define-key global-map (kbd "C-c r") 'revert-buffer) ;; Обновить буфер (revert)
  (define-key global-map (kbd "M-[") 'open-line-above) ;; Пустая строка сверху
  (define-key global-map (kbd "M-]") 'open-line-below) ;; Пустая строка снизу
  (define-key global-map (kbd "C-;") 'avy-goto-char) ;; Вызов Avy (аналог easymotion)
  (define-key global-map (kbd "C-x r d") 'bookmark-delete) ;; Удалить закладку
  (define-key global-map (kbd "C-x g") 'webjump) ;; Открыть сайт google/wiki английский вариант
  (define-key global-map (kbd "M-9") 'ergoemacs-mode) ;; Enable/disable ergoemacs-mode
  (define-key global-map (kbd "C-x t") 'customize-themes) ; Вызвать список тем
  (define-key global-map (kbd "C-)") 'web-mode) ;; Подключить web-mode, иногда слетает
  (define-key global-map (kbd "C-d") 'make-directory) ;; Создать новую директорию
  (define-key global-map (kbd "C-c 1") 'whitespace-mode) ;; Показать все пробелы, табуляции, переносы строк
  (define-key global-map (kbd "C-c 2") 'untabify) ;; Преобразовать табуляции в пробелы
  (define-key global-map (kbd "C-2") 'switch-to-buffer) ;; Открыть список всех буферов
  (define-key global-map (kbd "C-c n") 'cleanup-buffer) ;; Убрать все лишние пробела
  (define-key global-map (kbd "C-c s") 'shell) ;; Вызвать shell
  )
(my-keybindings) ;; Вызываем функцию для моих биндов
(provide 'fbinds)
