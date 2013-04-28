;;; emacsclient-mode.el --- Minor mode to assist with emacsclient invocations.

;; Authoer: Jeff Leverenz <jeff@dequeued.net>
;; Version: 0.1

(defun emacsclient-mode-save-done ()
  (interactive)
  (progn
    (save-buffer)
    (server-edit)))

;; Keymap for the emacsclient-mode minor mode.  Remaps C-x C-s to
;; emacsclient-mode-save-done.
(setq emacsclient-mode-map (make-sparse-keymap))
(define-key emacsclient-mode-map [(control x) (control s)] 'emacsclient-mode-save-done)

(define-minor-mode emacsclient-mode
  "This is a minor mode for buffers editing under emacsclient.
It is used to set a keymap that redefines C-x C-s to try to do
something smart: either svce-buffer and call server-done, or
just the normal save-buffer."
  nil " client"
  emacsclient-mode-map)  ;; keymap

(add-hook 'server-visit-hook 'emacsclient-mode)

(provide 'emacsclient-mode)
