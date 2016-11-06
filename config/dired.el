;;; dired-mode --- config
;;; Commentary:
;; Author: Xah Lee & carmack

;;; Code:
(require 'dired)
(defun xah-dired-sort ()
  "Sort dired dir listing in different ways.
Prompt for a choice.
URL `http://ergoemacs.org/emacs/dired_sort.html'
Version 2015-07-30"
  (interactive)
  (let (-sort-by -arg)
    (setq -sort-by (completing-read "Sort by:" '( "date" "size" "name" "dir")))
    (cond
     ((equal -sort-by "name") (setq -arg "-Al --si --time-style long-iso "))
     ((equal -sort-by "date") (setq -arg "-Al --si --time-style long-iso -t"))
     ((equal -sort-by "size") (setq -arg "-Al --si --time-style long-iso -S"))
     ((equal -sort-by "dir") (setq -arg "-Al --si --time-style long-iso --group-directories-first"))
     (t (error "Logic error 09535" )))
    (dired-sort-other -arg )))

;; Подключаем tramp
(setq ange-ftp-try-passive-mode t)
(setq ange-ftp-passive-host-alist nil)
(setq tramp-default-method "ftp")
(require 'tramp)

;; Создать новый файл
(defun dired-touch(fname)
  "Create new file"
  (interactive (list
                (read-string (format "New file: " (thing-at-point 'fname)
                                     nil nil (thing-at-point 'fname)))))
  (write-region "" nil fname t))

;; После загрузки dired подключить бинды к нему
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "w" 'dired-jump)
     (define-key dired-mode-map "b" 'xah-dired-sort)
     (define-key dired-mode-map "z" 'dired-touch)))

;;; dired.el ends here
