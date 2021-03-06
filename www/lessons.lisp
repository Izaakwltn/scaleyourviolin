;;;;lessons.lisp

(in-package :scaleyourviolin)

(defun lessons-page ()
  (generate-syv-html-file
   "lessons.html"
   (with-page (:title "Violin, Viola, and Mandolin Lessons")
     (:header
      (:h1 "Violin, Viola, and Mandolin Lessons"))
     (:section
      (:p "I offer violin, viola, and mandolin lessons virtually and in person in the Denver Area.")
      (:p "For the past 7 years I have taught students on all three instruments in both Denver and the Atlanta area, and I am passionate about tailoring a personalized approach to technique, focus practice, and musical expression for each individual student.")
      (:p "I teach, and have taught, all ages and levels of students, and I am just as passionate about creating a stable and enjoyable foundation for beginners as I am helping advanced students polish their most dazzling piece yet.")
      ;(:p "Read about my Teaching Philosophy" (:a :href "philsophy.html" "here"))
      (:hr)
      (:p "Virtual lessons are taught on Zoom, FaceTime, and Google Hangouts, and I'm always open to trying your preferred video-call service!")
      (:h5 "Please reach out with any questions or queries, or to set up your first lesson!")
      (:p (:a :href "mailto: izaakviolin@gmail.com" "izaakviolin@gmail.com"))))))

(lessons-page)

(push #'lessons-page *syv-refresh-list)
      
(push "lessons.html" *syv-wipe-list*)
