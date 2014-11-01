;;;; github-backup.lisp

(in-package #:github-backup)

;;; config

(defparameter *backup-basedir*
  (merge-pathnames "src/backups/" (user-homedir-pathname)))

(defparameter *token-pathname*
  (merge-pathnames ".ghbk" (user-homedir-pathname)))

;;; unix
(defun exec (pathname command &rest args)
  (let* ((out (make-synonym-stream '*standard-output*))
	 (err (make-synonym-stream '*error-output*))
	 (process (run-program command args
			       :directory pathname
			       :search t
			       :wait t
			       :output out
			       :error  err)))
    (zerop (process-exit-code process))))

;;; git
(defun git-clone (url pathname)
  "Clone GIT repo at URL into pathname directory"
  (exec *backup-basedir* "git" "clone" url pathname))

(defun git-pull (pathname)
  "Pull changes from GIT repo located in pathname directory"
  (exec pathname "git" "pull"))

;;; github
(defun read-access-token ()
  (when (probe-file *token-pathname*)
    (with-open-file (in *token-pathname*)
      (read-line in nil nil))))

(defun list-repositories ()
  (let ((token (read-access-token)))
    (api-command "/user/repos"
		 :parameters `(:access-token ,token))))

;; backup function
(defun backup-repository (name url)
  (let ((backup-dir (namestring (merge-pathnames name *backup-basedir*))))
    (format t "* ~a [~a]~%" name url)
    (force-output)
    (if (directory-exists-p backup-dir)
	(git-pull backup-dir)
	(git-clone url backup-dir))
    (terpri)))

(defun backup ()
  (let ((repos (list-repositories)))
    (ensure-directories-exist *backup-basedir*)
    (iterate (for repo in repos)
	     (for fork-p = (getf repo :FORK))
	     (for name   = (getf repo :NAME))
	     (for url    = (getf repo :GIT-URL))
	     (unless fork-p
	       (backup-repository name url)))))
