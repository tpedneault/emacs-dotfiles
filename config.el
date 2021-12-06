(setq package-archives
      '(("elpy" . "http://jorgenschaefer.github.io/packages/")
	("melpa" . "https://melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq default-tab-width 2)

(setq inhibit-startup-screen t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(toggle-scroll-bar -1)

(setq visible-bell nil)

(show-paren-mode 1)

(global-hl-line-mode +1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(defun reload-config () (interactive) (load-file "~/.emacs.d/init.el"))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(set-frame-parameter (selected-frame) 'alpha '(85. 85))
(add-to-list 'default-frame-alist '(alpha . (85. 85)))

(set-frame-font "FantasqueSansMono Nerd Font 14" nil t)

(use-package telephone-line
  :ensure t
  :init 
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil    . (telephone-line-minor-mode-segment
		     telephone-line-buffer-segment))))
  (setq telephone-line-rhs
	'((nil    . (telephone-line-misc-info-segment))
	  (accent . (telephone-line-major-mode-segment))
	  (evil   . (telephone-line-airline-position-segment))))

  :config (telephone-line-mode))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1))))

(use-package doom-modeline
  :ensure t
  :config (doom-modeline-mode t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config 
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "quit" 'evil-quit)
  (evil-define-key 'normal org-mode-map (kbd "C-SPC") 'org-cycle)
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
	 ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))

(setq ivy-virtual-abbreviate 'abbreviate
      ivy-rich-path-style 'abbrev
      all-the-icons-ivy-rich-icon-size 1.1)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay      0.5
	  treemacs-directory-name-transformer    #'identity
	  treemacs-display-in-side-window        t
	  treemacs-eldoc-display                 t
	  treemacs-file-event-delay              5000
	  treemacs-file-extension-regex          treemacs-last-period-regex-value
	  treemacs-file-follow-delay             0.2
	  treemacs-file-name-transformer         #'identity
	  treemacs-follow-after-init             t
	  treemacs-git-command-pipe              ""
	  treemacs-goto-tag-strategy             'refetch-index
	  treemacs-indentation                   2
	  treemacs-indentation-string            " "
	  treemacs-is-never-other-window         nil
	  treemacs-max-git-entries               5000
	  treemacs-missing-project-action        'ask
	  treemacs-move-forward-on-expand        nil
	  treemacs-no-png-images                 nil
	  treemacs-no-delete-other-windows       t
	  treemacs-project-follow-cleanup        nil
	  treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                      'left
	  treemacs-read-string-input             'from-child-frame
	  treemacs-recenter-distance             0.1
	  treemacs-recenter-after-file-follow    nil
	  treemacs-recenter-after-tag-follow     nil
	  treemacs-recenter-after-project-jump   'always
	  treemacs-recenter-after-project-expand 'on-distance
	  treemacs-show-cursor                   nil
	  treemacs-show-hidden-files             t
	  treemacs-silent-filewatch              nil
	  treemacs-silent-refresh                nil
	  treemacs-sorting                       'alphabetic-asc
	  treemacs-space-between-root-nodes      t
	  treemacs-tag-follow-cleanup            t
	  treemacs-tag-follow-delay              1.5
	  treemacs-user-mode-line-format         nil
	  treemacs-user-header-line-format       nil
	  treemacs-width                         35
	  treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode))

(use-package magit
  :ensure t)

(use-package vterm 
  :ensure t)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-l")
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :after lsp
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(setq lsp-ui-doc-enable t
      lsp-ui-doc-use-childframe t
      lsp-ui-doc-position 'top
      lsp-ui-doc-include-signature t
      lsp-ui-sideline-enable nil
      lsp-ui-flycheck-enable t
      lsp-ui-flycheck-list-position 'right
      lsp-ui-flycheck-live-reporting t
      lsp-ui-peek-enable t
      lsp-ui-peek-list-width 60
      lsp-ui-peek-peek-height 25
      )

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol
  :config (global-set-key ))

(use-package lsp-treemacs 
  :ensure t 
  :commands lsp-treemacs-errors-list)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :config 
  (setq company-idle-delay 0)
  (global-company-mode 1)
  )

(use-package dap-mode
  :ensure t
  :config (setq dap-auto-configure-features '(sessions locals controls tooltip)))

(use-package projectile
  :ensure t
  :config (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package yasnippet
  :ensure t)

(use-package yasnippet-snippets
  :ensure t)

(use-package ivy-yasnippet
  :ensure t)

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :config (cmake-font-lock-activate))


  (add-hook 'cmake-mode 'lsp-deferred)

(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)

(add-hook 'lua-mode-hook 'lsp-deferred)

(use-package php-mode
  :ensure t
  :mode ("\\.php\\'" . php-mode))

(use-package phpunit
  :ensure t)

(add-hook 'php-mode-hook 'lsp-deferred)

(use-package rust-mode 
  :ensure t)

(add-hook 'rust-mode-hook 'lsp-deferred)
