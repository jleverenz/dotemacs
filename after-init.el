;;
;; basic UI
;;

(setq-default truncate-lines 'true)     ; show truncated in display
(show-paren-mode t)
(load-theme 'solarized-dark t)
(global-hl-line-mode t)                 ; turn on global highlight line

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
