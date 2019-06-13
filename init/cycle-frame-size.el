;; This script makes (control-command-return on macos) cycle through three
;; hard-coded frame positions.

;; ((outer-position 685 . 23) (outer-size 595 . 768) (external-border-size 0 . 0) (title-bar-size 0 . 22) (menu-bar-external) (menu-bar-size 0 . 0) (tool-bar-external) (tool-bar-position . top) (tool-bar-size 0 . 0) (internal-border-width . 2))
;; ((outer-position 545 . 23) (outer-size 735 . 768) (external-border-size 0 . 0) (title-bar-size 0 . 22) (menu-bar-external) (menu-bar-size 0 . 0) (tool-bar-external) (tool-bar-position . top) (tool-bar-size 0 . 0) (internal-border-width . 2))
;; ((outer-position 6 . 23) (outer-size 1274 . 768) (external-border-size 0 . 0) (title-bar-size 0 . 22) (menu-bar-external) (menu-bar-size 0 . 0) (tool-bar-external) (tool-bar-position . top) (tool-bar-size 0 . 0) (internal-border-width . 2))

(setq cycle-frame-sizes-idx 0)

(defun cycle-frame-sizes ()
  (interactive)
  (if (= cycle-frame-sizes-idx 0)
      (progn
        (set-frame-position (selected-frame) 650 23)
        (set-frame-size (selected-frame) 595 768 t)))
  (if (= cycle-frame-sizes-idx 1)
      (progn
        (set-frame-position (selected-frame) 510 23)
        (set-frame-size (selected-frame) 735 768 t)))
  (if (= cycle-frame-sizes-idx 2)
      (progn
        (set-frame-position (selected-frame) 6 23)
        (set-frame-size (selected-frame) 1239 769 t)))
  (setq cycle-frame-sizes-idx (mod (1+ cycle-frame-sizes-idx) 3)))

(global-set-key [(control meta return)] 'cycle-frame-sizes)
