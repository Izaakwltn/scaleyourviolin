;;;;library-template.lisp
(in-package :scaleyourviolin)

(defmacro with-lib-page ((&key title) &body body)
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
       (:nav
	(:a :href "../home.html"                "Back to Scale your Violin")
	(:a :href "/library/refdesk.html"       "Reference Desk")
	(:a :href "/library/genres.html"        "Genres"
	(:a :href "/library/title-sort.html"    "Sort by Title")
	(:a :href "/library/composer-sort.html" "Sort by Composer")))
      (:body ,@body)
      (:footer "Scale your Violin - Copyright (c) 2021-2022"
	       (:a :href "www.github.com/izaakwltn"
		   "Written using Common Lisp"))))))

(defun generate-library-html (filename html-text)
  (with-open-file (output (concatenate 'string
				       *default-file-path*
				       "/www/library/"
				       filename)
			  :direction :output
			  :if-exists :overwrite
			  :if-does-not-exist :create)
    (format output "~a" html-text)))

;(defun pdf-post (pdf-object)
 ; (

(defun generate-pdf-list-page (page-title filename sorted-list)
  (generate-library-html
   filename
   (with-lib-page (:title page-title)
     (:header
      (:h3 page-title))
     (:section
      (loop for pdf-object in sorted-list
	    do (:a :href (concatenate 'string
				      "resources/"
				      (filename pdf-object))
		   (:h3 (title pdf-object))
		   (:p (composer pdf-object))
		   (:p (format nil "Genre: ~a" (genre pdf-object)))
		   (:hr)))))));;;format with ~%

;;;sort scales by difficulty
;;;piece by composer
;;;technique by composer
;;;etudes by composer
;;;collections by composer
;;;theory by title
;;;;------------------------------------------------------------------------
;;;;Refresh all library html
;;;;------------------------------------------------------------------------
(defvar *library-refresh-list* nil) ;;;; '((filename.html generation-function))

(defvar *library-wipe-list* nil)

(defun wipe-library-html-file (filename)
  (with-open-file (output (concatenate 'string
				       *default-file-path*
				       "/www/library/"
				       filename)
			  :direction :output
			  :if-exists :overwrite)
    (format output "~{~a~}"
	    (loop for i from 1 to (file-length output)
		  collect " "))))
  
(defun refresh-library-html ()
  (loop for file in *library-wipe-list*
	do (wipe-library-html-file file))
  (loop for f in *library-refresh-list*
	do (funcall f)))

(refresh-library-html);;;;do this every time a new item is added


