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
