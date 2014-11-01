;;;; package.lisp

(defpackage #:github-backup
  (:use #:cl #:iterate)
  (:shadowing-import-from #:sb-ext
			  #:run-program
			  #:process-exit-code)
  (:shadowing-import-from #:sb-posix
			  #:chdir
			  #:getcwd)
  (:shadowing-import-from #:cl-fad
			  #:directory-exists-p)
  (:shadowing-import-from #:cl-github
			  #:api-command)
  (:export #:backup))

