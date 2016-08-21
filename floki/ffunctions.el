;; =============================================================================
;;                                 USER FUNCTIONS
;; =============================================================================
;; Add Urban Dictionary to webjump
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
                '("Urban Dictionary" .
                  [simple-query
                   "www.urbandictionary.com"
                   "http://www.urbandictionary.com/define.php?term="
                   ""])))
;; IRC
(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
         :channels ("#emacs-beginners"))))

;; Пустая строка снизу
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

;; Пустая строка сверху
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

;; Cleanup buffer
(defun cleanup-buffer-safe ()
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))
(add-hook 'before-save-hook 'cleanup-buffer-safe)

(defun cleanup-buffer ()
  (interactive)
  (cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))
(provide 'ffunctions)
