;;; SW-NIX --- sw-nix-mode setup 

(reformatter-define nix-format
  :program "nix"
  :args (list "fmt" "--experimental-features" "'nix-command flakes'" (or (buffer-file-name) input-file))
  :stdout nil
  )

(add-hook 'nix-mode-hook 'nix-format-on-save-mode)

(provide 'sw-nix)
