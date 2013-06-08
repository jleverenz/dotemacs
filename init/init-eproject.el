(add-to-list 'load-path "~/.emacs.d/vendor/eproject/contrib")

(require 'eproject)
(require 'eproject-extras)
(require 'eproject-selectors)
(require 'eproject-find-cmd)
(require 'anything)
(require 'anything-config)
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

(defun anything-source-eproject--transform-to-short-names (candidates root)
  (mapcar (lambda (candidate)
            (let ((full-candidate-name (expand-file-name candidate)))
              (cons (file-relative-name full-candidate-name root)
                    full-candidate-name)))
            candidates))

(defvar anything-source-eproject-files
  '((name . "Files in eproject")
    (init . (lambda () (setq anything-source-eproject--root (eproject-root))))
    (candidates . (lambda ()
                    (eproject-list-project-files
                     anything-source-eproject--root)))
    (candidate-transformer . (lambda (candidates) (anything-source-eproject--transform-to-short-names
                                                   candidates
                                                   anything-source-eproject--root)))
    (type . file)
    (requires-pattern . 4)
    (delayed)
    ))

(defun anything-selector ()
  "Runs 'anything' with anything-sources temporarily set to
whatever makes sense for the current buffer."
  (interactive)
  (cond (eproject-mode
         (anything '(anything-c-source-buffers
                     anything-source-eproject-files)))
        (t
         (anything '(anything-c-source-buffers)))))

(add-hook 'eproject-mode-hook
          (lambda ()
            (define-key eproject-mode-map (kbd "C-,") 'eproject-find-cmd-custom-find-grep)))
(add-hook 'eproject-mode-hook
          (lambda ()
            (define-key eproject-mode-map (kbd "C-.") 'anything-selector)))
