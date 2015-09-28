(defpackage fx
  (:use :cl)
  (:export :gbp :usd :main))

(in-package :fx)

(defvar +url+ "http://download.finance.yahoo.com/d/quotes.csv?f=l1&s=~aEUR=X")

(defun get-rate (currency)
  (let ((result (drakma:http-request (format nil +url+ currency))))
    (read-from-string (flexi-streams:octets-to-string result))))

(defun convert (currency amount)
  (let ((rate (get-rate currency)))
    (* rate amount)))

(defun die (message)
  (format *error-output* message)
  (sb-ext:exit :code 1))

(defun convert-cli (currency argv)
  (unless (= (length argv) 1)
    (die "not enough arguments"))
  (let ((amount (read-from-string (first argv))))
    (unless (numberp amount)
      (die "invalid amount"))
    (format t "~a~%"
	    (convert currency amount))))

(defun gbp (argv)
  (convert-cli "GBP" (rest argv)))

(defun usd (argv)
  (convert-cli "USD" (rest argv)))

(defun main (argv)
  (let ((argv (rest argv)))
    (unless (= (length argv) 2)
      (error "not enough arguments"))
    (convert-cli (first argv) (rest argv))))
