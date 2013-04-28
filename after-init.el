;;
;; basic UI
;;

(setq ring-bell-function (lambda ()))	; no bells, audible or visible
(setq column-number-mode t)             ; col #'s in the mode-line
(setq-default truncate-lines 'true)     ; show truncated in display
(setq scroll-step 1)                    ; kbd scroll one line at a time
(global-hl-line-mode t)                 ; turn on global highlight line
(show-paren-mode t)

(global-auto-revert-mode t)		; auto revert buffers to disk changes
(setq-default make-backup-files nil)    ; Do not make backups on edit

(setq-default indent-tabs-mode nil)     ; Use spaces, not TAB characters

(load-theme 'solarized-dark t)
(custom-set-faces
 '(mode-line ((t (:foreground "white" :background "gray30")))))



;;
;; session package
;;

(session-initialize)


;;
;; swbuff - buffer switching
;;

(require 'swbuff)                       ; allow fast fwd/back buffer switching
(setq swbuff-exclude-buffer-regexps '("^ " "^\*.*\*")) ; ignore some buffers
(setq swbuff-clear-delay 1)
(setq swbuff-separator " | ")


;;
;; finish configuration
;;

(load "init/key-bindings")
