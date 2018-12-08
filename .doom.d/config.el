;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; EXWM
  (require 'exwm)
  (require 'exwm-config)
  (exwm-enable)
  ;; Set the initial workspace number.
  (setq exwm-workspace-number 0)
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))

  ;; Don't use evil-mode in exwm buffers
  (add-to-list 'evil-emacs-state-modes 'exwm-mode)

  ;; 's-N': Switch to certain workspace
  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                           (interactive)
                           (exwm-workspace-switch-create ,i))))
  ;; 's-r': Launch application
  (exwm-input-set-key (kbd "s-r")
                      (lambda (command)
                        (interactive (list (read-shell-command "$ ")))
                        (start-process-shell-command command nil command)))
  ;; Better window management
  (exwm-input-set-key (kbd "s-h") 'windmove-left)
  (exwm-input-set-key (kbd "s-j") 'windmove-down)
  (exwm-input-set-key (kbd "s-k") 'windmove-up)
  (exwm-input-set-key (kbd "s-l") 'windmove-right)
  (exwm-input-set-key (kbd "s-s") 'split-window-right)
  (exwm-input-set-key (kbd "s-v") 'split-window-vertically)
	  (advice-add 'split-window-right :after 'windmove-right)
	  (advice-add 'split-window-vertically :after 'windmove-down)
  (exwm-input-set-key (kbd "s-d") 'delete-window)
  (exwm-input-set-key (kbd "s-q") '(lambda ()
                                     (interactive)
                                     (kill-buffer (current-buffer))))
  (exwm-input-set-key (kbd "s-f") 'find-file)

  ;; Line-editing shortcuts
  (exwm-input-set-simulation-keys
   '(([?\C-b] . left)
     ([?\C-f] . right)
     ([?\M-f] . C-right)
     ([?\M-b] . C-left)
     ([?\C-y] . S-insert)
     ([?\C-p] . up)
     ([?\C-n] . down)
     ([?\C-a] . home)
     ([?\C-e] . end)
     ([?\M-v] . prior)
     ([?\C-v] . next)
     ([?\C-d] . delete)
     ([?\C-k] . (S-end delete))))


  ;; Disable dialog boxes since they are unusable in EXWM
  (setq use-dialog-box nil)

  ;; Set floating window border
  (setq exwm-floating-border-width 3)
  (setq exwm-floating-border-color "orange")

  ;; All buffers created in EXWM mode are named "*EXWM*". You may want to change
  ;; when a new window class name or title is available.
  ;; it in `exwm-update-class-hook' and `exwm-update-title-hook', which are run

;;;; INITIALIZATION
(require 'exwm)

;;;; FUNCTIONS
;;;; VARIABLES
(setq exwm-floating-border-width 2)
(setq exwm-floating-border-color "#3f3f3f")
(setq exwm-workspace-number      6)

  (push ?\C-q exwm-input-prefix-keys)
  (push ?\C-\\ exwm-input-prefix-keys)
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; The following example demonstrates how to use simulation keys to mimic the
  ;; behavior of Emacs. The argument to `exwm-input-set-simulation-keys' is a
  ;; list of cons cells (SRC . DEST), where SRC is the key sequence you press and
  ;; DEST is what EXWM actually sends to application. Note that SRC must be a key
  ;; sequence (of type vector or string), while DEST can also be a single key.

