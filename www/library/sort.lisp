;;;;sort.lisp
;;;

(in-package :scaleyourviolin)

;;;;Sort by Composer
;;;maybe separate functions for sort-by-composer and composer-sort-page, title too

;;;;------------------------------------------------------------------------
;;;;Sorting Functions
;;;;------------------------------------------------------------------------

(defun sort-by-composer (pdf-list)
  "Sorts a list of pdfs by composer."
  (sort (copy-list pdf-list)
	#'(lambda (pdf1 pdf2)
	    (string<= (composer pdf1) (composer pdf2)))))

(defun sort-by-title (pdf-list)
  "Sorts a list of pdfs by Title"
  (sort (copy-list pdf-list)
	#'(lambda (pdf1 pdf2)
	    (string<= (title pdf1) (title pdf2)))))

					;sort by difficulty maybe

;;;;------------------------------------------------------------------------
;;;;Sorted Pages- by Composer and by Title

(defun composer-sort ()
  "Generates the Sorted by Composer html file"
   (generate-pdf-list-page "All Items, Sorted by Composer"
			   "composer-sort.html"
			   (sort-by-composer *library-catalog*)))

(push #'composer-sort *library-refresh-list*)

(composer-sort)

(defun title-sort ()
   "Generates the Sorted by Title html file"
   (generate-pdf-list-page "All Items, Sorted by Title"
			   "title-sort.html"
			   (sort-by-title *library-catalog*)))
	   
(push #'title-sort *library-refresh-list*)

(title-sort)

