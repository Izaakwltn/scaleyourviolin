;;;;scaleyourviolin.asd

(asdf:defsystem #:scaleyourviolin
  :version "2.0.0"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "scaleyourviolin.com"
  :depends-on (#:hunchentoot #:spinneret #:vibratsia #:parse-float)
  :serial t
  :components ((:file "package")
	       (:file "build-site")
	       (:file "syv-page-template")
	       (:module "www"
		:serial t
		:components (;index.html
			     (:file "home") ;;;maybe one lisp file for page-generation
			     ;home.html
			     (:file "about")
			     ;about.html
			     (:file "contact")
			     ;contact.html
			     (:file "resonance")
			     (:file "resonance-output")
			     (:module "library"
			      :serial t
			      :components ((:file "library-template")
					   (:file "library-database")
					   (:file "library-backup")
					   
					    ;refdesk.html
					   (:file "sort")
					    ;composer-sort.html & title-sort.html
					   (:file "genres")
					   (:file "refdesk")
			;		    ;scales, technique, theory, pieces, etudes
					    (:file "difficulty")))))))
			;		    ;easy, intermediate, hard, virtuoso
