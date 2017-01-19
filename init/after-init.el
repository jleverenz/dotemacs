;; basic environment
(add-to-list 'exec-path (concat (getenv "HOME") "/bin"))

;;
;; basic UI
;;

(setq ring-bell-function (lambda ()))	; no bells, audible or visible
(setq column-number-mode t)             ; col #'s in the mode-line
(setq-default truncate-lines 'true)     ; show truncated in display
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(show-paren-mode t)
(adjust-width 100)                      ; wider view

(global-auto-revert-mode t)		; auto revert buffers to disk changes
(setq-default make-backup-files nil)    ; Do not make backups on edit
(setq vc-cvs-stay-local nil)            ; Turn off local CVS version backup files

(setq-default indent-tabs-mode nil)     ; Use spaces, not TAB characters
(setq-default fill-column 79)           ; Preserve comment column to end

(setq-default tab-stop-list
              '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80
                  84 88 92 96 100 104 108 112 116 120))

(when (mac-osx-p) (load "macosx"))
(when (windows-nt-p) (load "windows"))

; enable disabled commands

(put 'narrow-to-region 'disabled nil)   ; allow buffer narrow'ing
(put 'upcase-region 'disabled nil)      ; allow upcase'ing of regions
(put 'downcase-region 'disabled nil)    ; allow downcase'ing of regions

; themes / faces

(load-theme 'tango-dark)
(require 'highlight-current-line)


;;
;; session package
;;

(session-initialize)

;;
;; helm
;;

(require 'helm-config)

;;
;; swbuff - buffer switching
;;

(require 'swbuff)                       ; allow fast fwd/back buffer switching
(setq swbuff-exclude-buffer-regexps '("^ " "^\*.*\*")) ; ignore some buffers
(setq swbuff-include-buffer-regexps '("^\*scratch\*"))
(setq swbuff-clear-delay 1)
(setq swbuff-separator "   ")


;; uniquify - make nicer buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;
;; whitespace: nuke whitespaces when writing to a file
;;

(setq whitespace-style '(empty trailing))
(add-hook 'before-save-hook 'whitespace-cleanup)

;;
;; recentf
;;

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(add-to-list 'recentf-exclude "\\COMMIT_EDITMSG\\'")

;;
;; finish configuration
;;

(load "cider-init")

(load "auto-modes")
(load "key-bindings")

;; The following makes certain packages not load by default, but can be started
;; if needed.

(defun init-eproject-package ()
  "Load the eproject package and configuration."
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/vendor/eproject")
  (load "eproject-init"))

;; Turn off truncate-lines in compiles to see output easily.
(add-hook 'compilation-mode-hook (lambda ()
                                   (make-local-variable 'truncate-lines)
                                   (setq truncate-lines nil)))

;; Support for "private" .emacs pieces -- put anything sort of sensitive in
;; here.
(load "~/.emacs.d.private/init.el" t)   ; skip if missing


(require 'server)
(when (and (functionp 'server-running-p) (or (windows-nt-p)
                                             (not (server-running-p))))
  (server-start)
  (require 'emacsclient-mode))
