(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package ivy
  :ensure t
  :pin melpa)
(use-package evil
  :ensure t
  :pin melpa)

(evil-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(tsdh-dark))
 '(ivy-mode t)
 '(package-selected-packages
   '(projectile poetry counsel magit flycheck elpy yaml-mode ivy evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(ivy-mode 1)
(use-package projectile
  :ensure t)

(use-package yaml-mode
  :ensure t
  :pin melpa)

(use-package flycheck
  :ensure t
  :pin melpa)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path 'current))
(use-package company
  :ensure t)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(define-key flycheck-mode-map (kbd "C-c n") #'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-c p") #'flycheck-previous-error)

(use-package counsel
  :ensure t)
(setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))

(use-package swiper
  :ensure t
  :commands swiper
  :bind ("C-s" . counsel-grep-or-swiper)
  :config
  (require 'counsel)
  (setq counsel-grep-base-command "grep -niE \"%s\" %s")
  (setq ivy-height 20))

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'magit-file-popup)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
