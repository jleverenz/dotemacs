
(show-paren-mode t)
(load-theme 'solarized-dark t)

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
