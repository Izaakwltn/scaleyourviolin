;;;;library-database.lisp
;;;;
;;;;Copyright (c) 2022 Izaak Walton

(in-package :scaleyourviolin)


;;;Defining sheet-music-pdf class
(defclass sheet-music-pdf ()
  ((title      :initarg :title
	       :accessor title)
   (composer   :initarg :composer
	       :accessor composer)
   (genre      :initarg :genre
	       :accessor genre)
   (difficulty :initarg :difficulty
	       :accessor difficulty)
   (keywords   :initarg :keywords
	       :accessor keywords)
   (filename   :initarg :filename
	       :accessor filename)))

(defmethod print-object ((obj sheet-music-pdf) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((title title)
		     (composer composer)
		     (genre genre)
		     (difficulty difficulty)
		     (keywords keywords)
		     (filename filename))
	obj
      (format stream
	      "~%Title: ~a~%Composer:: ~a~%Genre: ~a~%Difficulty: ~a/10~%Keywords: ~a~%Filename: ~a~%"
	      title
	      composer
	      genre
	      difficulty
	      keywords
	      filename))))

(defun make-pdf-entry (title composer genre difficulty keywords filename)
  (make-instance 'sheet-music-pdf :title title
				  :composer composer
				  :genre genre
				  :difficulty difficulty
				  :keywords keywords
				  :filename filename))

;;;;------------------------------------------------------------------------
;;;;Building the Library Database
;;;;------------------------------------------------------------------------

(defvar *library-catalog* nil)

(defun add-to-catalog (title composer genre difficulty keywords filename)
  "Add entry to the library catalog"
  (push (make-pdf-entry title composer genre difficulty keywords filename)
	*library-catalog*))

(defun update-backup (title composer genre difficulty keywords filename)
  "Add entry to library-backup.lisp"
  (with-open-file (out (concatenate 'string
				    *default-file-path*
				    "/www/library/library-backup.lisp")
		       :direction :output
		       :if-exists :append)
    (format out
       "~%(add-to-catalog ~a  ~a  ~a  ~a  ~a ~a)"
       (write-to-string title)
       (write-to-string composer)
       (write-to-string genre)
       (write-to-string difficulty)
       (write-to-string keywords)
       (write-to-string filename))))

(defun add-to-library (title composer genre difficulty keywords filename)
  (add-to-catalog title composer genre difficulty keywords filename)
  (update-backup title composer genre difficulty keywords filename)
  (refresh-library-html))

;;;;------------------------------------------------------------------------
;;;;Easy catalog interface
;;;;------------------------------------------------------------------------

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun library-update ()
  "Prompts user through REPL for pdf data"
  (add-to-library (prompt-read "Title")
		  (prompt-read "Composer (Last, First)")
		  (prompt-read "Genre")
		  (prompt-read "Difficulty (1-10)")
		  (prompt-read "Keywords")
		  (prompt-read "filename")))

(defun update-library ()
  (loop (library-update)
	(if (not (y-or-n-p "Would you like to add another? [y/n]: ")) (return))))
