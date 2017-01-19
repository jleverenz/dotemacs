(cider-auto-test-mode t)

;; http://root42.blogspot.com/2014/08/how-to-automatically-refresh-cider-when.html
(add-hook 'cider-mode-hook
          '(lambda () (add-hook 'after-save-hook
                                '(lambda ()
                                   (if (and (boundp 'cider-mode) cider-mode)
                                       (progn
                                         (cider-refresh)
                                         (cider-load-buffer)))))))
