; jleverenz's .emacs

(tool-bar-mode -1)                      ; no thanks, tool bar
(menu-bar-mode -1)                      ; no thanks, menu bar
(setq inhibit-splash-screen t)          ; do not display splash on start-up

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; needed for package-installed-p to work at startup
(require 'package)
(package-initialize)

;; Packages installed -- TODO indicating versions here, but min
;; version only forces upgrade to latest when old (or no) version is
;; found.  No version "locking".
(defvar required-packages
  '( (session (2 2 1))                  ; maintain history across Emacs sessions
     (color-theme-solarized (20120301)) ; nice colors
     (yaml-mode (20130311 1301))
     (anything (20130323 1652))
     ))

(if (member nil (mapcar (lambda (pkg)
                          (apply 'package-installed-p pkg))
                        required-packages))
    (progn
      (package-refresh-contents)
      (mapc (lambda (pkg)
              (if (not (apply 'package-installed-p pkg))
                  (package-install (car pkg))))
            required-packages)))


(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "utils")

;; eproject
(add-to-list 'load-path "~/.emacs.d/vendor/eproject")

(add-hook 'after-init-hook (lambda () (load "after-init")))
