((annalist :source "elpaca-menu-lock-file" :recipe
	   (:package "annalist" :fetcher github :repo
		     "noctuid/annalist.el" :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "elpaca-menu-lock-file" :protocol https
		     :inherit t :depth treeless :ref
		     "e1ef5dad75fa502d761f70d9ddf1aeb1c423f41d"))
 (avy :source "elpaca-menu-lock-file" :recipe
      (:package "avy" :repo "abo-abo/avy" :fetcher github :files
		("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
		 "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
		 "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
		 "docs/*.texinfo"
		 (:exclude ".dir-locals.el" "test.el" "tests.el"
			   "*-test.el" "*-tests.el" "LICENSE"
			   "README*" "*-pkg.el"))
		:source "elpaca-menu-lock-file" :protocol https
		:inherit t :depth treeless :ref
		"933d1f36cca0f71e4acb5fac707e9ae26c536264"))
 (badwolf-theme :source "elpaca-menu-lock-file" :recipe
		(:package "badwolf-theme" :repo
			  "bkruczyk/badwolf-emacs" :fetcher github
			  :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			   "*.texinfo" "doc/dir" "doc/*.info"
			   "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			   "docs/dir" "docs/*.info" "docs/*.texi"
			   "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el"
				     "tests.el" "*-test.el"
				     "*-tests.el" "LICENSE" "README*"
				     "*-pkg.el"))
			  :source "elpaca-menu-lock-file" :protocol
			  https :inherit t :depth treeless :ref
			  "ea01a3d9358e968f75e3ed15dec6a2a96ce3d9a1"))
 (company :source "elpaca-menu-lock-file" :recipe
	  (:package "company" :fetcher github :repo
		    "company-mode/company-mode" :files
		    (:defaults "icons"
			       ("images/small"
				"doc/images/small/*.png"))
		    :source "elpaca-menu-lock-file" :protocol https
		    :inherit t :depth treeless :ref
		    "ca045bc54411f274779057d94a1807efe7f8d2a6"))
 (dash :source "elpaca-menu-lock-file" :recipe
       (:package "dash" :fetcher github :repo "magnars/dash.el" :files
		 ("dash.el" "dash.texi") :source
		 "elpaca-menu-lock-file" :protocol https :inherit t
		 :depth treeless :ref
		 "af5ea5d8a13735fa27d2c3e6f756d065639a7b45"))
 (dashboard :source "elpaca-menu-lock-file" :recipe
	    (:package "dashboard" :fetcher github :repo
		      "emacs-dashboard/emacs-dashboard" :files
		      (:defaults "banners") :source
		      "elpaca-menu-lock-file" :protocol https :inherit
		      t :depth treeless :ref
		      "e5fc08e78223487aa0da12539be1a23356c09ec7"))
 (elixir-mode :source "elpaca-menu-lock-file" :recipe
	      (:package "elixir-mode" :fetcher github :repo
			"elixir-editors/emacs-elixir" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "elpaca-menu-lock-file" :protocol
			https :inherit t :depth treeless :ref
			"00d6580a040a750e019218f9392cf9a4c2dac23a"))
 (elpaca :source
   "elpaca-menu-lock-file" :recipe
   (:source nil :protocol https :inherit ignore :depth 1 :repo
	    "https://github.com/progfolio/elpaca.git" :ref
	    "10e65441f34253254272aeacd300574b576894a2" :files
	    (:defaults "elpaca-test.el" (:exclude "extensions"))
	    :build (:not elpaca--activate-package) :package "elpaca"))
 (emacsql :source "elpaca-menu-lock-file" :recipe
	  (:package "emacsql" :fetcher github :repo "magit/emacsql"
		    :files (:defaults "README.md" "sqlite") :source
		    "elpaca-menu-lock-file" :protocol https :inherit t
		    :depth treeless :ref
		    "bc6713fb763388f43111ba1488df9263d5dc505b"))
 (envrc :source "elpaca-menu-lock-file" :recipe
	(:package "envrc" :fetcher github :repo "purcell/envrc" :files
		  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		   "doc/*.texinfo" "lisp/*.el" "docs/dir"
		   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		   (:exclude ".dir-locals.el" "test.el" "tests.el"
			     "*-test.el" "*-tests.el" "LICENSE"
			     "README*" "*-pkg.el"))
		  :source "elpaca-menu-lock-file" :protocol https
		  :inherit t :depth treeless :ref
		  "107dae065df857271cd3371d9f520ff13df695cf"))
 (evil :source "elpaca-menu-lock-file" :recipe
       (:package "evil" :repo "emacs-evil/evil" :fetcher github :files
		 (:defaults "doc/build/texinfo/evil.texi"
			    (:exclude "evil-test-helpers.el"))
		 :source "elpaca-menu-lock-file" :protocol https
		 :inherit t :depth treeless :ref
		 "334a636621577e77f834bca0c6ecdcec67c6ff1e"))
 (evil-collection :source "elpaca-menu-lock-file" :recipe
		  (:package "evil-collection" :fetcher github :repo
			    "emacs-evil/evil-collection" :files
			    (:defaults "modes") :source
			    "elpaca-menu-lock-file" :protocol https
			    :inherit t :depth treeless :ref
			    "3feaee8e2907703f1254910ce1937b2b4f1059d9"))
 (evil-easymotion :source "elpaca-menu-lock-file" :recipe
		  (:package "evil-easymotion" :repo
			    "PythonNut/evil-easymotion" :fetcher
			    github :files
			    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			     "*.texinfo" "doc/dir" "doc/*.info"
			     "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			     "docs/dir" "docs/*.info" "docs/*.texi"
			     "docs/*.texinfo"
			     (:exclude ".dir-locals.el" "test.el"
				       "tests.el" "*-test.el"
				       "*-tests.el" "LICENSE"
				       "README*" "*-pkg.el"))
			    :source "elpaca-menu-lock-file" :protocol
			    https :inherit t :depth treeless :ref
			    "f96c2ed38ddc07908db7c3c11bcd6285a3e8c2e9"))
 (goto-chg :source "elpaca-menu-lock-file" :recipe
	   (:package "goto-chg" :repo "emacs-evil/goto-chg" :fetcher
		     github :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "elpaca-menu-lock-file" :protocol https
		     :inherit t :depth treeless :ref
		     "72f556524b88e9d30dc7fc5b0dc32078c166fda7"))
 (gptel :source "elpaca-menu-lock-file" :recipe
	(:package "gptel" :repo "karthink/gptel" :fetcher github
		  :files
		  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		   "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		   "doc/*.texinfo" "lisp/*.el" "docs/dir"
		   "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		   (:exclude ".dir-locals.el" "test.el" "tests.el"
			     "*-test.el" "*-tests.el" "LICENSE"
			     "README*" "*-pkg.el"))
		  :source "elpaca-menu-lock-file" :protocol https
		  :inherit t :depth treeless :ref
		  "ca6086888ced9d01aec5ec3d7bbc69d308734b4f"))
 (highlight-indentation :source "elpaca-menu-lock-file" :recipe
			(:package "highlight-indentation" :repo
				  "antonj/Highlight-Indentation-for-Emacs"
				  :fetcher github :files
				  ("*.el" "*.el.in" "dir" "*.info"
				   "*.texi" "*.texinfo" "doc/dir"
				   "doc/*.info" "doc/*.texi"
				   "doc/*.texinfo" "lisp/*.el"
				   "docs/dir" "docs/*.info"
				   "docs/*.texi" "docs/*.texinfo"
				   (:exclude ".dir-locals.el"
					     "test.el" "tests.el"
					     "*-test.el" "*-tests.el"
					     "LICENSE" "README*"
					     "*-pkg.el"))
				  :source "elpaca-menu-lock-file"
				  :protocol https :inherit t :depth
				  treeless :ref
				  "d88db4248882da2d4316e76ed673b4ac1fa99ce3"))
 (inheritenv :source "elpaca-menu-lock-file" :recipe
	     (:package "inheritenv" :fetcher github :repo
		       "purcell/inheritenv" :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "elpaca-menu-lock-file" :protocol https
		       :inherit t :depth treeless :ref
		       "b9e67cc20c069539698a9ac54d0e6cc11e616c6f"))
 (ivy :source "elpaca-menu-lock-file" :recipe
      (:package "ivy" :repo "abo-abo/swiper" :fetcher github :files
		(:defaults "doc/ivy-help.org"
			   (:exclude "swiper.el" "counsel.el"
				     "ivy-hydra.el" "ivy-avy.el"))
		:source "elpaca-menu-lock-file" :protocol https
		:inherit t :depth treeless :ref
		"2257a9d0519e18f5ce7a7fafda8a1a8e5023628e"))
 (llama :source "elpaca-menu-lock-file" :recipe
	(:package "llama" :fetcher github :repo "tarsius/llama" :files
		  ("llama.el" ".dir-locals.el") :source
		  "elpaca-menu-lock-file" :protocol https :inherit t
		  :depth treeless :ref
		  "5990ae7b5cba3425252f64b9377352c9a01690d5"))
 (magit :source "elpaca-menu-lock-file" :recipe
	(:package "magit" :fetcher github :repo "magit/magit" :files
		  ("lisp/magit*.el" "lisp/git-*.el" "docs/magit.texi"
		   "docs/AUTHORS.md" "LICENSE" ".dir-locals.el"
		   (:exclude "lisp/magit-section.el"))
		  :source "elpaca-menu-lock-file" :protocol https
		  :inherit t :depth treeless :host github :tag
		  "v4.3.8" :ref
		  "5b820a1d1e94649e0f218362286d520d9f29ac2c"))
 (magit-section :source "elpaca-menu-lock-file" :recipe
		(:package "magit-section" :fetcher github :repo
			  "magit/magit" :files
			  ("lisp/magit-section.el"
			   "docs/magit-section.texi"
			   "magit-section-pkg.el")
			  :source "elpaca-menu-lock-file" :protocol
			  https :inherit t :depth treeless :ref
			  "5b820a1d1e94649e0f218362286d520d9f29ac2c"))
 (nix-mode :source "elpaca-menu-lock-file" :recipe
	   (:package "nix-mode" :fetcher github :repo "NixOS/nix-mode"
		     :files
		     (:defaults
		      (:exclude "nix-company.el" "nix-mode-mmm.el"))
		     :source "elpaca-menu-lock-file" :protocol https
		     :inherit t :depth treeless :ref
		     "719feb7868fb567ecfe5578f6119892c771ac5e5"))
 (orderless :source "elpaca-menu-lock-file" :recipe
	    (:package "orderless" :repo "oantolin/orderless" :fetcher
		      github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "elpaca-menu-lock-file" :protocol https
		      :inherit t :depth treeless :ref
		      "31812d9252c6cfa7eae8fa04cd40c8b2081e9936"))
 (org :source "elpaca-menu-lock-file" :recipe
      (:package "org" :repo
		("https://git.sr.ht/~bzg/org-mode" . "org") :pre-build
		(progn
		  (require 'elpaca-menu-org)
		  (setq elpaca-menu-org-make-manual t)
		  (elpaca-menu-org--build))
		:autoloads "org-loaddefs.el" :depth treeless :build
		(:not elpaca--generate-autoloads-async) :files
		(:defaults ("etc/styles/" "etc/styles/*" "doc/*.texi"))
		:source "elpaca-menu-lock-file" :protocol https
		:inherit t :ref
		"c356e1c9b750740a9066ebddb53be055531fa076"))
 (org-roam :source "elpaca-menu-lock-file" :recipe
	   (:package "org-roam" :fetcher github :repo
		     "org-roam/org-roam" :files
		     (:defaults "extensions/*") :source
		     "elpaca-menu-lock-file" :protocol https :inherit
		     t :depth treeless :ref
		     "89dfaef38b6caa3027f20f96a551dc8f194ac533"))
 (org-roam-ui :source "elpaca-menu-lock-file" :recipe
	      (:package "org-roam-ui" :fetcher github :repo
			"org-roam/org-roam-ui" :files
			(:defaults "out") :source
			"elpaca-menu-lock-file" :protocol https
			:inherit t :depth treeless :ref
			"5ac74960231db0bf7783c2ba7a19a60f582e91ab"))
 (projectile :source "elpaca-menu-lock-file" :recipe
	     (:package "projectile" :fetcher github :repo
		       "bbatsov/projectile" :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "elpaca-menu-lock-file" :protocol https
		       :inherit t :depth treeless :ref
		       "9325c45e0fd96d5421e75ad901a91ee5353e10ad"))
 (python-mode :source "elpaca-menu-lock-file" :recipe
	      (:package "python-mode" :fetcher gitlab :repo
			"python-mode-devs/python-mode" :files
			("python-mode.el"
			 ("completion" "completion/pycomplete.*"))
			:source "elpaca-menu-lock-file" :protocol
			https :inherit t :depth treeless :ref
			"6f32eec5a6e11d79dcf49495795bb971f6238eda"))
 (reformatter :source "elpaca-menu-lock-file" :recipe
	      (:package "reformatter" :repo
			"purcell/emacs-reformatter" :fetcher github
			:files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "elpaca-menu-lock-file" :protocol
			https :inherit t :depth treeless :ref
			"c52e91d5438b9bf16b77b4384822e254f10a6b0a"))
 (scala-mode :source "elpaca-menu-lock-file" :recipe
	     (:package "scala-mode" :fetcher github :repo
		       "hvesalai/emacs-scala-mode" :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "MELPA" :protocol https :inherit t
		       :depth treeless :ref
		       "661337d8aa0a0cb418184c83757661603de3b2e3"))
 (simple-httpd :source "elpaca-menu-lock-file" :recipe
	       (:package "simple-httpd" :repo
			 "skeeto/emacs-web-server" :fetcher github
			 :files
			 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			  "*.texinfo" "doc/dir" "doc/*.info"
			  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			  "docs/dir" "docs/*.info" "docs/*.texi"
			  "docs/*.texinfo"
			  (:exclude ".dir-locals.el" "test.el"
				    "tests.el" "*-test.el"
				    "*-tests.el" "LICENSE" "README*"
				    "*-pkg.el"))
			 :source "elpaca-menu-lock-file" :protocol
			 https :inherit t :depth treeless :ref
			 "3982c55e9061475038a3ccd61aecb2de3d407cec"))
 (solo-jazz-theme :source "elpaca-menu-lock-file" :recipe
		  (:package "solo-jazz-theme" :fetcher github :repo
			    "cstby/solo-jazz-emacs-theme" :files
			    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			     "*.texinfo" "doc/dir" "doc/*.info"
			     "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			     "docs/dir" "docs/*.info" "docs/*.texi"
			     "docs/*.texinfo"
			     (:exclude ".dir-locals.el" "test.el"
				       "tests.el" "*-test.el"
				       "*-tests.el" "LICENSE"
				       "README*" "*-pkg.el"))
			    :source "elpaca-menu-lock-file" :protocol
			    https :inherit t :depth treeless :ref
			    "51d63d8a2c855f4ea79eef9fc9c8a5c9702642c4"))
 (sqlformat :source "elpaca-menu-lock-file" :recipe
	    (:package "sqlformat" :fetcher github :repo
		      "purcell/sqlformat" :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "elpaca-menu-lock-file" :protocol https
		      :inherit t :depth treeless :ref
		      "69ef8bec3ac8c9ce4a60f20a9721e4d7a592a84d"))
 (transient :source "elpaca-menu-lock-file" :recipe
	    (:package "transient" :fetcher github :repo
		      "magit/transient" :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "elpaca-menu-lock-file" :protocol https
		      :inherit t :depth treeless :ref
		      "07a104aa73b5d5e3168ba6e202ebfb60188af6ed"))
 (websocket :source "elpaca-menu-lock-file" :recipe
	    (:package "websocket" :repo "ahyatt/emacs-websocket"
		      :fetcher github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "elpaca-menu-lock-file" :protocol https
		      :inherit t :depth treeless :ref
		      "40c208eaab99999d7c1e4bea883648da24c03be3"))
 (with-editor :source "elpaca-menu-lock-file"
   :recipe
   (:package "with-editor" :fetcher github :repo "magit/with-editor"
	     :files
	     ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	      "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	      "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	      "docs/*.texinfo"
	      (:exclude ".dir-locals.el" "test.el" "tests.el"
			"*-test.el" "*-tests.el" "LICENSE" "README*"
			"*-pkg.el"))
	     :source "elpaca-menu-lock-file" :protocol https :inherit
	     t :depth treeless :ref
	     "7787e19764c1089390584ac17a80129ef9afaa14")))
