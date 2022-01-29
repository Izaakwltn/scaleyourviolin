;;;;build-site.lisp
;;;;

(in-package :scaleyourviolin)

(defvar *server*
  (make-instance 'hunchentoot:easy-acceptor
		 :port 4242
		 :document-root
		 #p"/home/izaakwalton/programming/lisp-projects/scaleyourviolin/www/")) ;;;change this to your path to /www

(defvar *default-file-path* "programming/lisp-projects/scaleyourviolin") ;;;;change this to your path to /scaleyourviolin

(defun launch ()
  (refresh-syv-html)
  (refresh-library-html)
  (hunchentoot::start *server*))

                                              
