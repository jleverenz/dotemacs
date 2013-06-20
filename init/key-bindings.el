
(global-set-key [f8] 'goto-scratch-buffer)
(global-set-key [f12] 'revert-buffer)

; switch back & forth through buffers
(global-set-key [(control meta left)] 'swbuff-switch-to-next-buffer)
(global-set-key [(control meta right)] 'swbuff-switch-to-previous-buffer)

(global-set-key [(control meta up)] 'previous-error)
(global-set-key [(control meta down)] 'next-error)
(global-set-key [(meta /)] 'hippie-expand)
(global-set-key [(control \")] 'call-last-kbd-macro)

(global-set-key [(control c)(down)] 'copy-line-down)
(global-set-key [(control c)(s)] 'sort-lines)
(global-set-key [(control meta return)] 'eval-and-replace)

(global-set-key [(meta down)] 'static-scroll-up)
(global-set-key [(meta up)] 'static-scroll-down)
