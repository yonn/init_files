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

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(defun play-typewriter-sound ()
  (let ((data-directory "~/.emacs.d/Sounds"))
    (play-sound `(sound :file "typewriter-new.wav"))))

(defun play-typewriter-sound-maybe ()
  (if (eq this-command 'self-insert-command)
      (play-typewriter-sound)))

(add-hook 'post-command-hook #'play-typewriter-sound-maybe)

(require 'evil)
(evil-mode t)

(require 'helm-config)

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
(ido-mode 'buffers) ;; only use this line to turn off ido for file names!
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))

(setq confirm-nonexistent-file-or-buffer nil)

;(ac-config-default)

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

;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(autoload 'utop-minor-mode "utop" "Toplevel for OCaml" t)
;(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

(add-to-list 'load-path "~/.opam/4.03.0/share/emacs/site-lisp")
(require 'ocp-indent)
(require 'merlin)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)
  (setq merlin-command 'opam)))

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(slime-setup '(slime-fancy slime-company))

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
 '(inhibit-startup-screen t)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
