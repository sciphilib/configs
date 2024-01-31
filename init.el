(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/plugins/")

(load "vertico-config")

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-Iosvkem t))

(set-frame-font "Iosevka-12" nil t)

(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-display-line-numbers-mode t)
;;(setq display-line-numbers-type 'relative)

;; open shell
(defun open-term-in-split-window ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (let ((current-dir default-directory))
    (ansi-term (getenv "SHELL"))))
(defun open-term-in-split-window-emacs ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (let ((current-dir default-directory))
    (shell (getenv "SHELL"))))
(global-set-key (kbd "C-x C-u") 'open-term-in-split-window)
(global-set-key (kbd "C-x C-y") 'open-term-in-split-window-emacs)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package neotree
  :ensure t
  :bind ("C-x C-a" . neotree-toggle))

(add-to-list 'auto-mode-alist '("\\.java\\'" . java-mode))
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4)
                            (setq tab-width 4)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1)
  :config
  (setq git-gutter:modified-sign "~")
  (setq git-gutter:added-sign    "+")
  (setq git-gutter:deleted-sign  "-")
  )
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
;; Mark current hunk
(global-set-key (kbd "C-x v SPC") 'git-gutter:mark-hunk)

;; (use-package diff-hl
;;   :ensure t
;;   :init
;;   (global-diff-hl-mode)
;;   (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
;;   :config
;;   )
;; (global-set-key (kbd "C-x v n") 'diff-hl-next-hunk)
;; (global-set-key (kbd "C-x v p") 'diff-hl-previous-hunk)

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 5))

(use-package lsp-mode
  :ensure t
  :hook (java-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package lsp-java
  :ensure t
  :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp))

(use-package eyebrowse
  :ensure t
  :config
  (eyebrowse-mode t))
(global-set-key (kbd "C-c C-w C-n") 'eyebrowse-prev-window-config)
(global-set-key (kbd "C-c C-w C-p") 'eyebrowse-next-window-config)
(global-set-key (kbd "C-c C-w <number>") 'eyebrowse-switch-to-window-config-<number>)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(gitter neotree use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
