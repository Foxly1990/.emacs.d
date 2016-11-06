;;; function --- Cleanup buffer
;;; Commentary:
;;; Code:
(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a 'before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(add-hook 'before-save-hook 'cleanup-buffer-safe)

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))

;; Binds
(define-key global-map (kbd "C-c 1") 'whitespace-mode) ;; Показать все пробелы, табуляции, переносы строк
(define-key global-map (kbd "C-c 2") 'untabify) ;; Преобразовать табуляции в пробелы
(define-key global-map (kbd "C-c r") 'revert-buffer) ;; Обновить буфер (revert)
(define-key global-map (kbd "C-c n") 'cleanup-buffer) ;; Убрать все лишние пробела

;;; clean-buffer.el ends here
