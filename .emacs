; jleverenz's .emacs

(tool-bar-mode -1)                      ; no thanks, tool bar
(menu-bar-mode -1)                      ; no thanks, menu bar

(setq inhibit-splash-screen t)          ; do not display splash on start-up
(setq ring-bell-function (lambda ()))	; no bells, audible or visible
(setq column-number-mode t)             ; col #'s in the mode-line

(global-auto-revert-mode t)		; auto revert buffers to disk changes

(setq-default indent-tabs-mode nil)     ; Use spaces, not TAB characters
(setq-default make-backup-files nil)    ; Do not make backups on edit

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; needed for package-installed-p to work
(require 'package)
(package-initialize)                    

;; Packages installed -- TODO indicating versions here, but minimum
;; version only force upgrade to latest when old version is found.  No
;; version "locking".
(defvar required-packages 
  '( (session (2 2 1))               ; maintain history across Emacs sessions
     ))

(if (member nil (mapcar (lambda (pkg) 
                          (package-installed-p (car pkg) (cadr pkg)))
                        required-packages))
    (progn
      (package-refresh-contents)
      (mapc (lambda (pkg)
              (if (not (package-installed-p (car pkg) (cadr pkg)))
                  (package-install (car pkg))))
            required-packages)))

(load "init/macosx")
(load "ext/swbuff")
(load "lisp/utils")
(add-hook 'after-init-hook (lambda () (load "after-init")))
