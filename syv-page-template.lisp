;;;;syv-page-template.lisp
;;;;

(in-package :scaleyourviolin)

(defmacro with-page ((&key title) &body body)
  `(spinneret::with-html-string
     (:doctype)
     (:html
      (:head
       (:meta :charset "utf-8")
       (:meta :name "viewport" :content "width=device-width, initial-scale=1")
       (:link :rel "stylesheet"
	      :href "https://cdn.simplecss.org/simple.min.css")
       (:title ,title))
      (:header
       (:nav ;maybe eventually fill with a loop from a list of pages
	(:a :href "home.html" "Scale your Violin")
	(:a :href "about.html" "About")
	(:a :href "lessons.html" "Lessons")
	(:a :href "resonance.html" "Resonance Calculator")
	(:a :href "library/refdesk.html" "Sheet Music Library")))
      (:body ,@body)
      (:footer "Scale your Violin - Copyright (c) 2021-2022 "
	       (:a :href "https://www.github.com/izaakwltn"
		   "Written using Common Lisp")))))

;;;;HTML generation

(defun generate-syv-html-file (filename html-text)
  (with-open-file (output (concatenate 'string
				      ; *default-file-path*
				       "/home/izaakwalton/programming/lisp-projects/scaleyourviolin/www/"
				       filename)
			  :direction :output
			  :if-exists :overwrite
			  :if-does-not-exist :create)
  (format output "~a" html-text)))

;;;;------------------------------------------------------------------------
;;;;Refresh html for all Scale Your Violin pages
;;;;------------------------------------------------------------------------

(defvar *syv-refresh-list* nil)

(defvar *syv-wipe-list* nil)

(defun wipe-syv-html-file (filename)
  (with-open-file (output (concatenate 'string
				      
				       "/home/izaakwalton/programming/lisp-projects/scaleyourviolin/www/"
				       filename)
			  :direction :output
			  :if-exists :overwrite)
    (format output "~{~a~}"
	    (loop for i from 1 to (+ (file-length output) 2)
		  collect " "))))

(defun refresh-syv-html ()
  (loop for file in *syv-wipe-list*
	do (wipe-syv-html-file file))
  (loop for f in *syv-refresh-list*
	do (funcall f)))
