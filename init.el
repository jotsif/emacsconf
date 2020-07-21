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

(use-package ag
  :ensure t
  :pin melpa)

(use-package flycheck
  :ensure t
  :pin melpa)

(use-package eclim
  :ensure t
  :pin melpa)
(add-hook 'java-mode-hook 'eclim-mode)
(custom-set-variables
 '(eclim-eclipse-dirs '("~/eclipse/java-2020/Eclipse.app/Contents/MacOS/eclipse"))
 '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
 '(eclimd-executable "~/eclipse/java-2020-03/Eclipse.app/Contents/Eclipse/eclimd")
 '(eclimd-default-workspace "~/eclipse-workspace/"))

(use-package ensime
  :ensure t
  :pin melpa-stable
  :config
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-sem-high-face '((implicitConversion nil) (implicitParams nil))))

(use-package sbt-mode
  :ensure t
  :pin melpa)

(use-package yaml-mode
  :ensure t
  :pin melpa)

(use-package scala-mode
  :ensure t
  :pin melpa)

(use-package vue-html-mode
  :ensure t
  :pin melpa)

(use-package vue-mode
  :ensure t
  :pin melpa)

(use-package ido
  :ensure t
  :pin melpa
  :config
  (ido-mode +1)
  (ido-everywhere +1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package flx-ido
  :ensure t
  :pin melpa
  :config
  (flx-ido-mode +1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package projectile
  :ensure t
  :bind ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode +1))

(use-package ess
  :ensure t
  :init (require 'ess-site))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-python-command "python3"))

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq python-shell-interpreter "python3"
      python-shell-prompt-detect-failure-warning nil)

(use-package ein
  :pin melpa
  :ensure t
  :config
  (setq ein:default-url-or-port 8888))

(use-package sql
  :ensure t)

(global-unset-key (kbd "C-z"))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (eclim json-mode haskell-mode flycheck jedi ein vue-html-mode vue-mode ensime use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:cell-input-area ((t (:background "dark cyan")))))

(setq js-indent-level 2)

(put 'upcase-region 'disabled nil)



;; Haskell stuff

(use-package haskell-mode
  :ensure t)
(put 'downcase-region 'disabled nil)
