(asdf:defsystem #:fx
  :description "Convert amount in given currency based on yahoo FX rates"
  :author "Philippe Mechai <philippe.mechai@gmail.com>"
  :license "MIT"
  :depends-on (#:drakma)
  :serial t
  :components ((:file "fx")))
