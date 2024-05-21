(require 'helm-projectile)

(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-projectile-files-list
                                  helm-source-recentf
                                  helm-source-buffer-not-found))
;; ----
;; https://github.com/emacs-helm/helm/issues/1492

(defun helm-buffers-sort-transformer@donot-sort (_ candidates _)
  candidates)

(advice-add 'helm-buffers-sort-transformer :around 'helm-buffers-sort-transformer@donot-sort)

;; --- filter out some uninteresting buffers
;; https://www.reddit.com/r/emacs/comments/4r2p0f/hide_some_buffers_in_helmbufferslist/
(defun bsl/filter-buffers (buffer-list)
  (delq nil (mapcar
             (lambda (buffer)
               (cond
                    ((eq (with-current-buffer buffer major-mode)  'dired-mode) nil)
                    ;; ((eq (with-current-buffer buffer major-mode)  'org-mode) nil)
                    ;; ((eq (with-current-buffer buffer major-mode)  'org-agenda-mode) nil)
                    (t buffer)))
             buffer-list)))

(advice-add 'helm-skip-boring-buffers :filter-return 'bsl/filter-buffers)
(advice-remove 'helm-skip-boring-buffers 'bsl/filter-buffers)
