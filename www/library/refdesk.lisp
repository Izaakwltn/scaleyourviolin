;;;;refdesk.lisp

(in-package :scaleyourviolin)

(defun refdesk ()
  (generate-library-html
   "refdesk.html"
   (with-lib-page (:title "Reference Desk")
     (:header
      (:h1 "Reference Desk"))
     (:section
      (:h3 "Welcome to the Scale your Violin Sheet Music Library.")
      (:h4 "Browse by " (:a :href "/library/genres.html" "Genre,"))
      (:h4 "Browse by " (:a :href "/library/difficulty.html" "Difficulty,"))
      (:h4 "Or browse all items sorted by "
	   (:a :href "/library/title-sort.html" "title")
	   "or "
	   (:a :href "/library/composer-sort.html" "composer."))
      (:hr)
      (:p "All music not originally by Izaak Walton or written for "
	  (:a :href "../home.html" "scaleyourviolin.com ")
	  "is sourced from "
	  (:a :href "https://www.imslp.org" "IMSLP.org, ")
	  "the preeminent library of public domain sheet music. I have gone through IMSLP and picked out the violin music I am most likely to recommend to students, and the editions I find most interesting or easiest to read.")
      (:hr)))))
     ;(:section
     ; (:h5 (:a :href "/library/title-sort.html" "All Items Sorted by Title"))
     ; (:h5 (:a :href "/library/composer-sort.html" "All Items Sorted by Composer"))
     ; (:h4 "Browse by Difficulty: ")
     ; (:h4 "Browse by " (:a :href "/library/genres.html" "Genre:"))
     ; (:h5 (loop for g in *genres*
;		 do (:p (:a :href (second g) (first g)))))))))

(push #'refdesk *library-refresh-list*)

(push "refdesk.html" *library-wipe-list*)

(refdesk)
 
