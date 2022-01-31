;;;;home.lisp

(in-package :scaleyourviolin)

(defun home-page ()
  (generate-syv-html-file "index.html"
   (with-page (:title "Scale your Violin")
    (:header
     (:h1 "Scale Your Violin"))
    (:section
     (:img
      :src
      "https://upload.wikimedia.org/wikipedia/commons/e/ed/Ex_%22Kurtz%22_Violin_MET_DP147093.\jpg"
      :width "600"
      :height "auto")
     (:p "Hello, and welcome to Scale Your Violin, a virtual violin studio dedicated to helping students find their best sound, fastest progress, and most effective technique possible!")
     (:p "I am Izaak Walton, a violinist, teacher, arranger, and tinkerer based out of Denver. You can read more about me "
	 (:a :href "about.html" "here."))
     (:p "Learn about the science behind intonation with the" (:a :href "/resonance.html" "resonance calculator."))
     (:p "Explore my "
	 (:a :href "/library/refdesk.html" "Sheet Music Library, ")
	 "a collection of materials I have written and arranged, in addition to standard works of violin technique and repertoire.")
     (:p "Read about my teaching philosophy, and look into "
	 (:a :href "/lessons.html" "violin, viola, or mandolin lessons."))
     (:p "Or simply get in touch:"
	 (:a :href "mailto: izaakviolin@gmail.com" "izaakviolin@gmail.com"))))))

(home-page)

(push #'home-page *syv-refresh-list*)

(push "index.html" *syv-wipe-list*)
