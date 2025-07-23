;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(require 'package)
(package-initialize)


;; INITIAL VARIABLES
(setq is-home-station (if (getenv "HOMESTATION") t nil))
(setq lsp-folder (getenv "LSP_FOLDER"))
(setq emacs-root-dir (getenv "EMACS_ROOT_DIR")) ;; .emacs.d
(cl-assert emacs-root-dir nil "Environment variable missing: EMACS_ROOT_DIR")




;; (setq you-know '(combobulate
;; 			:url "https://github.com/mickeynp/combobulate.git"
;; 			:branch "59b64d66d66eb84da6a2cedd152b1692378af674"))

;; (package-vc-install you-know)



;; Paths & packages

(setq emacs-tools-dir (file-name-concat emacs-root-dir "tools"))

(add-to-list 'load-path "~/.emacs.d/sw")
(add-to-list 'load-path "~/.emacs.d/sw/modes")
(add-to-list 'load-path "~/.emacs.d/sw/fancy")


;; GENERAL PACKAGES

;;;; Libs
(require 'sw-libs)
(require 'sw-settings)
;;;; Modes - Basics
(require 'sw-evil)
(require 'sw-evil-easymotion)
(require 'sw-org)
(require 'sw-eglot)
(require 'sw-dap)
(require 'sw-magit)
(require 'sw-projectile)
(require 'sw-company)
(require 'sw-ivy)
(require 'sw-envrc)
(require 'sw-copilot)



;;;; Modes - Lenguages
(require 'sw-emacs-lisp)
(require 'sw-erlang)
(require 'sw-elixir)
(require 'sw-c)
(require 'sw-scala)
(require 'sw-python)
(require 'sw-sql)
(require 'sw-hocon)

;;;; Modes - Others
(require 'sw-pairing)

;;;; Fancy
(require 'sw-themes)
(require 'sw-dashboard)


;;;; Tools
(require 'sw-mail)

;; ;;;; Vertico
;; (if (package-installed-p 'vertico) (require 'vertico) (package-vc-install 'vertico))
;; (vertico-mode 1)
;;;;;; AUTOCOMPLETION END





(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

