;;;; github-backup.asd

(asdf:defsystem #:github-backup
  :description "Describe github-backup here"
  :author "Philippe Mechai <philippe.mechai@gmail.com>"
  :license "MIT"
  :depends-on ("iterate" "cl-fad" "cl-github-v3")
  :serial t
  :components ((:file "package")
               (:file "github-backup")))

