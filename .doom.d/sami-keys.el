;; ~~ leader single ~~
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b"  'switch-to-buffer
  "w"  'save-buffer
  "t"  'neotree-toggle
  "u"  'undo
  "r"  'redo
  "`"  'header-insert
  "y"  'undo-tree-visualize
  "x"  'save-buffers-kill-emacs
  "u"  'org-insert-link
  "o"  'other-window
  "d"  'delete-window
  "D"  'delete-other-windows
  "h"  'split-window-below
  "v"  'split-window-right
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "f"  'dired
  "e"  'helm-find-files)

(provide 'sami-keys)
