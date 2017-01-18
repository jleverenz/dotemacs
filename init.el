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
     (yaml-mode (20130311 1301))
     (cygwin-mount (2001))
     (gist (20130315 2306))
     (rvm (20130521 902))
     (haml-mode (20130130 1622))
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


(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "utils")

;; un-packaged packages
(add-to-list 'load-path "~/.emacs.d/vendor/eproject")
(add-to-list 'load-path "~/.emacs.d/vendor/swbuff")

(add-hook 'after-init-hook (lambda () (load "after-init")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(highlight-current-line-globally t nil (highlight-current-line))
 '(package-selected-packages
   (quote
    (helm highlight-current-line go-mode jsx-mode yaml-mode swift-mode session rvm haml-mode gist cygwin-mount clojure-mode clj-mode)))
 '(session-use-package t nil (session)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-current-line-face ((t (:background "grey25"))))
 '(mode-line ((t (:foreground "white" :background "gray30")))))
