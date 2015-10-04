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

(defun convert-cli (currency argv)
  (unless (= (length argv) 1)
    (uiop:die 1 "~a: not enough arguments (received ~a)" (uiop:argv0) argv))
  (let ((amount (read-from-string (first argv))))
    (unless (numberp amount)
      (uiop:die 1 "'~a' is not a valid amount" (first argv)))
    (format t "~a~%"
	    (convert currency amount))))

(defun gbp (argv)
  (convert-cli "GBP" argv))

(defun usd (argv)
  (convert-cli "USD" argv))

(defun main (argv)
  (unless (= (length argv) 2)
    (uiop:die 1 "~a: invalid number of arguments.~%Usage: ~a <CURRENCY> <AMOUNT>~%" (uiop:argv0) (uiop:argv0)))
  (convert-cli (first argv) (rest argv)))

