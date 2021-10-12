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
 '(all-the-icons-ivy-rich-mode t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#c5c8c6"))
 '(beacon-color "#cc6666")
 '(custom-safe-themes
   '("0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e76668f7efa2c9297c3998aba61876e757c99c1e5325c135433cf4f53a95df15" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "d36e851fab767ad68cdabbae5784dbe88d090b011dd721eee8e527e21f5422af" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(electric-indent-mode nil)
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(helm-completion-style 'emacs)
 '(helm-minibuffer-history-key "M-p")
 '(lsp-ui-sideline-current-symbol
   ((t
     (:foreground "gray" :box
		  (:line-width -1 :color "cyan")
		  :weight ultra-bold :height 0.99))))
 '(markdown-code-face ((t (:inherit consolas))))
 '(package-selected-packages
   '(vterm doom-modeline exec-path-from-shell php-mode hover lsp-dart magit telephone-line spaceline-all-the-icons spaceline smartparens color-theme-sanityinc-tomorrow company lsp-treemacs lsp-ivy monokai-theme obsidian-theme zenburn-theme lsp-ui lsp-mode web-mode treemacs-all-the-icons page-break-lines all-the-icons-ivy-rich ivy-rich counsel all-the-icons-ivy evil-collection dashboard cmake-ide irony-mode rtags-helm company-rtags js2-mode vue-mode company-mode go-mode-load go-imports go-mode dracula-theme treemacs-icons-dired treemacs-projectile treemacs-evil projectile org-sticky-header gruvbox-theme badger-theme rustic which-key dap-mode helm-lsp robe all-the-icons neotree yasnippet-snippets flycheck irony-eldoc company-irony minions mood-line atom-one-dark-theme evil helm use-package))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
