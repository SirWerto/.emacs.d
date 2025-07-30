;;; SW-Eglot --- sw-evil-mode setup

;;;; LSP -> EGLOT
(require 'eglot)
(setq eglot-ignored-server-capabilities `(:documentHighlightProvider))

;; (add-to-list 'eglot-server-programs `(c-mode  , (concat lsp-folder "/" "clangd")))
;; (add-to-list 'eglot-server-programs `(erlang-mode  , (concat lsp-folder "/" "elp")))
;; (add-to-list 'eglot-server-programs `(elixir-mode , (file-symlink-p (concat lsp-folder "/" "start_lexical.sh"))))

;;(add-to-list 'eglot-server-programs `(erlang-mode  , ("elp" "server")))
(add-to-list 'eglot-server-programs (list 'erlang-mode  "elp" "server"))
(add-to-list 'eglot-server-programs `(python-mode . ,(eglot-alternatives '(("ty" "server") 
("pyright-langserver" "--stdio")))))



(evil-all-global-set-key (kbd "C-c e r") 'eglot-rename)
(evil-all-global-set-key (kbd "C-c e h") 'eldoc)
(evil-all-global-set-key (kbd "C-c e f d") 'xref-find-definitions)
(evil-all-global-set-key (kbd "C-c e f r") 'xref-find-references)
(evil-all-global-set-key (kbd "C-c e c a") 'eglot-code-actions)
(evil-all-global-set-key (kbd "C-c e b f") 'eglot-format-buffer)


(defun lsp-format-on-save-hook () "Add hook to format on save with the LSP via eglot." (add-hook 'after-save-hook #'eglot-format-buffer nil t))



(provide 'sw-eglot)
