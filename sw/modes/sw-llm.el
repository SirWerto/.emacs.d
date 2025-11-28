;;; SW-LLM --- sw-llm-mode setup 


(defconst prompts-directory
  (expand-file-name "prompts/" data-directory)
  "Directory to store prompts."
  )

(defun get-string-from-file (filePath)
  "Return content from FILEPATH as string."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))





(setq main-llm-model "llama2:7b")
(setq gptel-backend (gptel-make-ollama (concat saposa " to your service")
                 :host "localhost:11434"
                 :stream t
                 :models (list main-llm-model)))

(setq gptel-model main-llm-model)

(setf (alist-get 'python-docstring gptel-directives)
      (get-string-from-file (expand-file-name "python-docstring.txt" prompts-directory))
      )


(evil-all-global-set-key (kbd "C-c l l m") 'gptel)
(evil-all-global-set-key (kbd "C-c l l q") 'gptel-menu)

(provide 'sw-llm)
