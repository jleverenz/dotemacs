(add-to-list 'load-path "~/.emacs.d/vendor/eproject/contrib")

(require 'eproject)
(require 'eproject-extras)
(require 'eproject-compile)
(require 'eproject-selectors)
(require 'eproject-find-cmd)
(require 'grep)

(define-project-type dotemacs (generic)
  (eproject-select-by-path-match "/dotemacs/" ".*/\.emacs\.d/")
  :find-cmd-sexp (and (prune (name ".git" ".session" "auto-save-list" "elpa"))
                      (and (not (name ".session")) (type "f"))))

(defun eproject-find-cmd-custom-find-grep ()
  (interactive)
  (let ((search-string (grep-read-regexp))
        (find-cmd-sexp (eproject-find-cmd--sexp-or-default)))
    (find-grep (format "%s | \"xargs\" -0 grep -nH %s"
                       (concat (build-cd-and-find-cmd (eproject-root) find-cmd-sexp)
                              " -print0")
                       (smart-grep-args search-string)))))
