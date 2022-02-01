;;;;about.lisp

(in-package :scaleyourviolin)

(defun about-page ()
  (generate-syv-html-file
   "about.html"
   (with-page (:title "About")
     (:header
      (:h1 "About"))
     (:section
      (:h3 "Izaak Walton")
      (:p "Hello! I'm Izaak, a violinist and teacher of violin, viola, and mandolin based out of Denver, CO.")
      (:br)
      (:iframe :width "560"
	      :height "315"
	      :src "https://www.youtube.com/embed/heN-QRplYyo"
	      :title "YouTube video player")
      (:p "I have taught the violin, viola, and mandolin extensively, teaching a wide variety of ages, levels, and styles. Although I am trained in the Suzuki method, I employ a variety of musical texts when developing a custom plan of study for an individual student, drawing technique from Flesch, Sevcik, Galamian, and Auer methods.")
      (:p "As a teacher, I am particularly passionate about helping students find the best sound on their instrument, both through technical setup, ear training, and musical development. Finding a strong, focused sound as a foundation for their further studies can, and will, carry the student far into their musical explorations!")
      (:p "In addition to teaching, I have over a decade of professional performance experience, and over half a decade of teaching experience. Throughout the Southeast United States and the Denver Metropolitan Area, I have performed in a variety of ensembles, from string quartets and orchestras, to recording orchestras and rock back-up string sections.")
      (:p " I received my Bachelors in Violin Performance from the University of Georgia, studying with Levon Ambartsumian, Shakhida Azimkodjaeva, and Dr. Michael Heald, in addition to Raymond Leung of the Atlanta Symphony. In 2017 I moved out here to Denver, receiving my Masters in Violin Performance with Dr. Linda Wang at the University of Denver." ))
     (:section
      (:hr)
      (:h3 "Recordings")
      (:hr)
      (:iframe :width "560"
	       :height "315"
	       :src "https://www.youtube.com/embed/0yJFuwiJtzY"
	       :title "YouTube video player")
      (:iframe :width "560"
	       :height "315"
	       :src "https://www.youtube.com/embed/zQIrFpwC7qc"
	       :title "YouTube video player")
      (:iframe :width "560"
	       :height "315"
	       :src "https://www.youtube.com/embed/0m-k7PPf0Nk"
	       :title "YouTube video player")
      (:iframe :width "560"
	       :height "315"
	       :src "https://www.youtube.com/embed/tF8q1nDrul0"
	       :title "YouTube video player")
      (:hr)
      (:p "New Music Premieres:")
      (:hr)
      (:iframe :width "100%"
	       :height "300"
	       :src "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/771818542&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true")
      (:iframe :width "100%"
	       :height "300"
	       :src "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/355808177&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true")
      (:iframe :width "100%"
	       :height "300"
	       :src "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/415159962&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true")
      (:iframe :width "100%"
	       :height "300"
	       :src "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/653750411&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true")))))
	       ;:frameborder "0"
	       ;:allow "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
	       ;:allowfullscreen)))))
			     

(about-page)

(push #'about-page *syv-refresh-list*)

(push "about.html" *syv-wipe-list*)
