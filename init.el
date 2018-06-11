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

(use-package jedi
  :ensure t
  :config
  (setq jedi:server-command '("/usr/local/bin/python3" "/Users/josef/.emacs.d/elpa/jedi-core-0.2.7/jediepcserver.py")))

(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-python-command "/usr/local/bin/python3"))

(setq python-shell-interpreter "/usr/local/bin/python3"
      python-shell-prompt-detect-failure-warning nil)

(elpy-enable)

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

(setq sql-default-directory "/rutilus1.fishbrain.com:")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (elpy jedi ein vue-html-mode vue-mode ensime use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq js-indent-level 2)

(put 'upcase-region 'disabled nil)
