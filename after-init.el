;;
;; basic UI
;;

(setq ring-bell-function (lambda ()))	; no bells, audible or visible
(setq column-number-mode t)             ; col #'s in the mode-line
(setq-default truncate-lines 'true)     ; show truncated in display
(setq scroll-step 1)                    ; kbd scroll one line at a time
(global-hl-line-mode t)                 ; turn on global highlight line
(show-paren-mode t)
(adjust-width 100)                      ; wider view

(global-auto-revert-mode t)		; auto revert buffers to disk changes
(setq-default make-backup-files nil)    ; Do not make backups on edit

(setq-default indent-tabs-mode nil)     ; Use spaces, not TAB characters
(setq-default fill-column 79)           ; Preserve comment column to end

(setq-default tab-stop-list
              '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80
                  84 88 92 96 100 104 108 112 116 120))

(when (mac-osx-p) (load "init/macosx"))

; enable disabled commands

(put 'narrow-to-region 'disabled nil)   ; allow buffer narrow'ing
(put 'upcase-region 'disabled nil)      ; allow upcase'ing of regions
(put 'downcase-region 'disabled nil)    ; allow downcase'ing of regions

; themes / faces

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
;; whitespace: nuke whitespaces when writing to a file
;;

(setq whitespace-style '(empty trailing))
(add-hook 'before-save-hook 'whitespace-cleanup)


;;
;; finish configuration
;;

(load "init/key-bindings")
(load "init/init-eproject")

(require 'server)
(when (and (functionp 'server-running-p) (or (windows-nt-p)
                                             (not (server-running-p))))
  (server-start)
  (require 'emacsclient-mode))
