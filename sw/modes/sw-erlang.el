;;; SW-ERLANG --- sw-erlang-mode setup 

;; (if (package-installed-p 'erlang) (require 'erlang) (package-vc-install 'erlang))


;; (package-vc-install
;;   '(erlang :url "https://github.com/erlang/otp.git"
;; 	 :lisp-dir "lib/tools/emacs"
;; 	 :doc "lib/tools/emacs/internal_doc/emacs.sgml"))

(setq otp-path (file-name-concat (getenv "ASDF_DIR") "installs/erlang/27.0"))

(setq load-path (cons (file-name-concat otp-path "lib/tools-4.0/emacs") load-path))
(setq erlang-root-dir otp-path)
(setq exec-path (cons (file-name-concat otp-path "bin") exec-path))
(require 'erlang-start)




;;;###autoload (autoload 'rebar3-erlfmt-format-buffer "current-file" nil t)
;;;###autoload (autoload 'rebar3-erlfmt-format-region "current-file" nil t)
;;;###autoload (autoload 'rebar3-erlfmt-format-on-save-mode "current-file" nil t)
(reformatter-define rebar3-erlfmt-format
  :program "rebar3"
  :args (list "fmt" (or (buffer-file-name) input-file))
  )

(add-hook 'erlang-mode-hook 'rebar3-erlfmt-format-on-save-mode)




(provide 'sw-erlang)
