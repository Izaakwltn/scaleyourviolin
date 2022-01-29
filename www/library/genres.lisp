;;;;genres.lisp

(in-package :scaleyourviolin)

;;;;------------------------------------------------------------------------
;;;;Genres: Violin Scales, Violin Technique, Violin Etudes, Violin Repertoire, Violin Theory, Viola Scales, Viola Technique, Viola Etudes, Viola Repertoire, Viola Theory, Mandolin Repertoire, Mandolin Technique, 
;;;;------------------------------------------------------------------------

(defvar *genres* '(("Violin Scales"           "violin-scales.html")
		   ("Violin Technique"        "violin-technique.html")
		   ("Violin Etudes"           "violin-etudes.html")
		   ("Violin Repertoire"       "violin-repertoire.html")
		   ("Violin Theory"           "violin-theory.html")
		   ("Viola Scales"            "viola-scales.html")
		   ("Viola Technique"         "viola-technique.html")
		   ("Viola Etudes"            "viola-etudes.html")
		   ("Viola Repertoire"        "viola-repertoire.html")
		   ("Viola Theory"            "viola-theory.html")
		   ("Mandolin Repertoire"     "mandolin-repertoire.html")
		   ("Mandolin Technique"      "mandolin-technique.html")
		   ("Ensemble"                "ensemble.html")))

(defun genre-sift (genre-string library-list)
  "Sifts through a list of pdfs and returns those with the corresponding genre."
  (sort (copy-list (remove-if-not #'(lambda (pdf)
		     (string-equal (genre pdf) genre-string))
				  library-list))
	#'(lambda (pdf1 pdf2) (string<= (composer pdf1) (composer pdf2)))))

(defun generate-genres-html ()
  "Generates html file for each genre."
  (loop for g in *genres*
	do (generate-pdf-list-page (first g)
				   (second g)
				   (genre-sift (first g) *library-catalog*))))

(defun genres-page ()
  (generate-library-html
   "genres.html"
  (with-lib-page (:title "Genres")
    (:header
     (:h1 "Genres"))
    (:section
     (loop for g in *genres*
	   do (:p
	       (:a :href (second g)
		   (first g))))))))

(generate-genres-html)

(push #'generate-genres-html *library-refresh-list*)

(loop for i in (mapcar #'second *genres*)
      do (push i *library-wipe-list*))

(genres-page)

(push #'genres-page *library-refresh-list*)

(push "genres.html" *library-wipe-list*)
		  
;;;one function
