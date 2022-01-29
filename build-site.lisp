;;;;build-site.lisp
;;;;

(in-package :scaleyourviolin)

(defvar *server*
  (make-instance 'hunchentoot:easy-acceptor
		 :port 4242
		 :document-root
		 #p"/home/izaak/programming/lisp/scaleyourviolin/www/")) ;;;change this to your path

(defun launch ()
  (hunchentoot::start *server*))

(defvar *default-file-path* "programming/lisp/scaleyourviolin") ;;;;change this to your path to scaleyourviolin
                                              
