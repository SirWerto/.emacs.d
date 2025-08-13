;;; SW-LLM --- sw-llm-mode setup 

(if (package-installed-p 'gptel) (require 'gptel) (package-vc-install 'gptel))


(setq main-llm-model "smollm:135m")
(setq gptel-backend (gptel-make-ollama (concat saposa " to your service")
                 :host "localhost:11434"
                 :stream t
                 :models (list main-llm-model)))

(setq gptel-model main-llm-model)


(evil-all-global-set-key (kbd "C-c l l m") 'gptel)
(evil-all-global-set-key (kbd "C-c l l q") 'gptel-menu)

(provide 'sw-llm)
