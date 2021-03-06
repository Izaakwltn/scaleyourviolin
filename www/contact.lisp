;;;;contact.lisp

(in-package :scaleyourviolin)

(defun contact-page ()
  (generate-syv-html-file "contact.html"
			  (with-page (:title "Contact")
    (:header
     (:h1 "Contact"))
    (:section
     (:h2 "Send me an email at:")
     (:h3 (:a :href "mailto: izaakviolin@gmail.com" "izaakviolin@gmail.com"))))))

(contact-page)

(push #'contact-page *syv-refresh-list*)

(push "contact.html" *syv-wipe-list*)
