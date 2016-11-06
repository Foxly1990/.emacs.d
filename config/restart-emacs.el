;;; md-restart-emacs --- restart Emacs
;;; Commentary:
;; This function restart Emacs

;;; Code:
(defun emacs-restart-in-kill ()
  "Restart function."
  (apply 'call-process (concat invocation-directory invocation-name)
         nil 0 nil nil)
  ;; Wait to give focus to new Emacs instance
  ;; (sleep-for 3)
  )
(defun emacs-restart ()
  "Restart Emacs."
  (interactive)
  (if (not window-system)
      (message "Can't restart emacs if window-system is nil")
    (let ((wait 1))
      (while (> (setq wait (1- wait)) 0)
        (message (propertize (format "Will restart Emacs in %d seconds..." wait)
                             'face 'secondary-selection))
        (sit-for 1)))
    (add-hook 'kill-emacs-hook 'emacs-restart-in-kill t)
    (save-buffers-kill-emacs)))

;; Binds
(define-key global-map (kbd "C-x R") 'emacs-restart)

;;; restart-emacs.el ends here
