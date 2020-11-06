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
   '(vterm poetry magit flycheck elpy yaml-mode ivy evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(ivy-mode 1)
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

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(define-key flycheck-mode-map (kbd "C-c n") #'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-c p") #'flycheck-previous-error)
