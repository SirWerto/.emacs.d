;;; SW-COPILOT --- sw-copilot-mode setup 

(if is-home-station
    (progn
     (if (package-installed-p 'gptel) (require 'gptel) (package-vc-install 'gptel))
     (setq
      gptel-model "codellama:latest"
      gptel-backend (gptel-make-ollama "Ollama"
                      :host "localhost:11434"
                      :stream t
                      :models '("codellama:latest")))
 
     (keymap-global-set "C-c c o s" 'gptel-send)
     (keymap-global-set "C-c c o m" 'gptel-menu)))

(provide 'sw-copilot)
