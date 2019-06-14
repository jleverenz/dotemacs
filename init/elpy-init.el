(eval-after-load "elpy"
  '(cl-dolist (key '("C-<up>" "C-<down>" "C-<left>" "C-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))

(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(elpy-enable)
