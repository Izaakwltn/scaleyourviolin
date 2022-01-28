;;;;build-site.lisp
;;;;

(in-package :scaleyourviolin)

(defvar *server*
  (make-instance 'hunchentoot:easy-acceptor
		 :port 4242
		 :document-root
		 #p"/home/izaakwalton/programming/lisp-projects/scaleyourviolin/www/"))

(defun launch ()
  (hunchentoot::start *server*))
                                              
