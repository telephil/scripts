;;;; missing-id3.lisp
(defpackage #:missing-id3
  (:use #:cl #:cl-fad)
  (:export #:find-in #:main))

(in-package #:missing-id3)

;;; utils
(defun read-single-byte (in)
  (code-char (read-byte in nil nil)))

(defun id3-p (filename)
  "Check if file has an ID3"
  (when (probe-file filename)
    (with-open-file (in filename :direction :input :element-type 'unsigned-byte)
      (string-equal "ID3"
		    (coerce
		     (list (read-single-byte in)
			   (read-single-byte in)
			   (read-single-byte in))
		     'string)))))

(defun mp3-p (pathname)
  "Check if pathname is a file with the mp3 extension"
  (and (not (directory-pathname-p pathname))
       (string-equal "mp3" (pathname-type pathname))))

;;; public api
(defun find-in (directory)
  "Search directory for all MP3 files that dont't have ID3 info"
  (walk-directory directory
		  (lambda (pathname)
		    (format t "~a~%" pathname))
		  :test
		  (lambda (pathname)
		    (and (mp3-p pathname) (not (id3-p pathname))))))

;; script api
(defun main (argv)
  (unless (= 1 (length argv))
    (uiop:die 1 "Invalid number of arguments.~%Usage: ~a <directory>~%" (uiop:argv0)))
  (missing-id3:find-in (first argv)))
