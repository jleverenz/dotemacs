; jleverenz's .emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(tool-bar-mode -1)                      ; no thanks, tool bar
(menu-bar-mode -1)                      ; no thanks, menu bar
(setq inhibit-splash-screen t)          ; do not display splash on start-up

(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/lisp")
(mapcar 'load
        '("utils"
          "auto-complete-init"
          "projectile-init"
          "elpy-init"
          "helm-init"))

(add-hook 'after-init-hook (lambda () (load "after-init")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(global-hl-line-mode t)
 '(helm-buffer-max-length nil)
 '(js-indent-level 2)
 '(line-spacing 0.25)
 '(package-selected-packages
   (quote
    (graphql-mode tuareg auto-complete dockerfile-mode typescript-mode php-mode exec-path-from-shell json-mode js-comint markdown-mode gitignore-mode rjsx-mode elpy ensime helm-projectile projectile ripgrep yafolding scala-mode yaml-mode helm)))
 '(typescript-indent-level 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#030303" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
 '(ensime-implicit-highlight ((t nil)))
 '(hl-line ((t (:background "grey15"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.3))))
 '(mode-line ((t (:foreground "white" :background "gray30")))))
