(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "C-x O") 'previous-multiframe-window)

(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'solarized-theme)
(customize-set-variable 'frame-background-mode 'dark)
(load-theme 'solarized t)

(defalias 'terminal 'ansi-term)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'smartparens-config)

(defun play-typewriter-sound ()
  (let ((data-directory "~/.emacs.d/Sounds"))
    (play-sound `(sound :file "typewriter-new.wav"))))

(defun play-typewriter-sound-maybe ()
  (if (eq this-command 'self-insert-command)
      (play-typewriter-sound)))

(add-hook 'post-command-hook #'play-typewriter-sound-maybe)

(require 'evil)
(evil-mode t)

(evil-set-initial-state 'terminal 'emacs)

(setq c-default-style "linux"
      tab-width 8
      indent-tabs-mode t)

(global-set-key (kbd "DEL") 'backward-delete-char)
(setq c-backspace-function 'backward-delete-char)

(global-linum-mode t)
(setq column-number-mode t)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))

(defun c++-custom-keywords ()
  (font-lock-add-keywords nil `(("\\<\\(nullptr\\)" . 'font-lock-keyword-face))))

(add-hook 'c++-mode-hook 'c++-custom-keywords)

(add-hook 'c++-mode-hook #'smartparens-mode)

(setq confirm-nonexistent-file-or-buffer nil)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)



(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(asm-comment-char 35)
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
