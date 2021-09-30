(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "d36e851fab767ad68cdabbae5784dbe88d090b011dd721eee8e527e21f5422af" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(electric-indent-mode nil)
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(helm-completion-style 'emacs)
 '(lsp-ui-sideline-current-symbol
   ((t
     (:foreground "gray" :box
		  (:line-width -1 :color "cyan")
		  :weight ultra-bold :height 0.99))))
 '(markdown-code-face ((t (:inherit consolas))))
 '(package-selected-packages
   '(js2-mode vue-mode smartparens company-mode go-mode-load go-imports go-mode dracula-theme treemacs-icons-dired treemacs-projectile treemacs-evil projectile org-sticky-header gruvbox-theme badger-theme rustic which-key dap-mode helm-lsp lsp-ui lsp-mode robe all-the-icons neotree yasnippet-snippets flycheck irony-eldoc company-irony minions mood-line atom-one-dark-theme evil helm use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
