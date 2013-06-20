;; TODO: if there is a region, copy the region down instead
(defun copy-line-down ()
  "Insert a copy of the current line below itself, and move point to same
column position on the new line."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (kill-ring-save (mark) (point))
    (beginning-of-line)
    (next-line 1)
    (yank)
    (newline)
    )
  (next-line 1)
  )

(defun windows-nt-p ()
  "Returns t if called on a Windows NT system."
   (equal system-type 'windows-nt))

(defun mac-osx-p ()
  "Returns t if called on an OSX system."
   (equal system-type 'darwin))

(defun adjust-width (c)
  "Resize the frame width"
  (interactive "nWidth for frame: ")
  (set-frame-width (selected-frame) c)
)

(defun eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))

(defun mixed-case-p (str)
  "Return t or nil indicating if STR contains any caps."
  (let ((case-fold-search nil))
    (if (string-match "[A-Z]" str) t nil)))

(defun smart-grep-args (search-string)
  "Check case of argument, and return the correct args for a grep call."
  (format "%s '%s'"
          (if (mixed-case-p search-string) "-e" "-i -e")
          search-string))

(defun goto-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*")
  )

;; static-scroll-* scrolls a window, keeping the point on the same line.

(defun static-scroll-down () (interactive) (scroll-down 1))
(defun static-scroll-up () (interactive) (scroll-up 1))
