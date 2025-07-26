;;; SW-LLM --- sw-llm-mode setup 

(if (package-installed-p 'gptel) (require 'gptel) (package-vc-install 'gptel))

(setq gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '(smollm:135m)))

(setq gptel-model 'smollm:135m)


(evil-all-global-set-key (kbd "C-c l l m b") 'gptel)
(evil-all-global-set-key (kbd "C-c l l m q s") 'gptel-send)
(evil-all-global-set-key (kbd "C-c l l m q m") 'gptel-menu)


(provide 'sw-llm)
