;;;; missing-id3.asd

(asdf:defsystem #:missing-id3
  :description "A small utility script to find all files lacking an ID3"
  :author "Philippe Mechai <philippe.mechai@gmail.com>"
  :license "MIT"
  :depends-on (#:cl-fad)
  :serial t
  :components ((:file "package")
               (:file "missing-id3")))

