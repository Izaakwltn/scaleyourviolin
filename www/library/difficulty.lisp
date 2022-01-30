;;;;difficulty.lisp

(in-package :scaleyourviolin)

(defvar *difficulties* '(("Beginner"     (1 2 3)   "beginner.html")
			 ("Intermediate" (3 4 5)   "intermediate.html")
			 ("Advanced"     (5 6 7 8) "advanced.html")
			 ("Virtuoso"     (8 9 10)  "virtuoso.html")))

(defun sift-by-rating (rating-range library-list)
  "Selects items that have the given rating"
  (remove-if-not #'(lambda (item)
		     (member (parse-integer (difficulty item)) rating-range))
				  library-list))

(defun sort-by-rating (pdf-list)
  "Sorts a list of pdfs by their difficulty rating"
  (sort (copy-list pdf-list)
	#'(lambda (pdf1 pdf2)
	    (< (parse-integer (difficulty pdf1))
	       (parse-integer (difficulty pdf2))))))
	
;;;;------------------------------------------------------------------------
;;;;Generate each difficulty page:
;;;;------------------------------------------------------------------------

(defun generate-difficulties-html ()
  "Generates a html file for each difficulty."
  (loop for d in *difficulties*
	do (generate-pdf-list-page (first d)
				   (third d)
				   (sort-by-title
				    (sift-by-rating (second d) *library-catalog*)))))

(generate-difficulties-html)

(push #'generate-difficulties-html *library-refresh-list*)

(loop for i in (mapcar #'third *difficulties*)
      do (push i *library-wipe-list*))

;;;;------------------------------------------------------------------------
;;;;Generate Main Difficulties page
;;;;------------------------------------------------------------------------

(defun difficulty-page ()
  (generate-library-html
   "difficulty.html"
   (with-lib-page (:title "Levels of Difficulty")
     (:header
      (:h1 "Levels of Difficulty"))
     (:section
      (loop for d in *difficulties*
	    do (:p
		(:a :href (third d)
		    (first d))))))))

(difficulty-page)

(push #'difficulty-page *library-refresh-list*)

(push "difficulty.html" *library-wipe-list*)
