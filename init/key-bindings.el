
; switch back & forth through buffers
(global-set-key [(control meta left)] 'swbuff-switch-to-next-buffer)
(global-set-key [(control meta right)] 'swbuff-switch-to-previous-buffer)

(global-set-key [(control c)(down)] 'copy-line-down)
(global-set-key [(control c)(s)] 'sort-lines)
