(require 'helm-config)
(require 'helm-projectile)

(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-projectile-files-list
                                  helm-source-recentf
                                  helm-source-buffer-not-found))
