(ql:quickload "prove")

(defparameter *source-files*
  '("source/solver.lisp"))

(defun compile-sources ()
  (mapc #'compile-file *source-files*))

(defun load-sources ()
  (mapc #'load *source-files*))

(defun compile-and-load ()
  (mapc (lambda (file)
          (load (compile-file file)))
        *source-files*))


(defparameter *test-files*
  '("tests/helper-tests.lisp"))

(defun compile-tests ()
  (mapc #'compile-file *test-files*))

(defun load-tests ()
  (mapc #'load *test-files*))

(defun compile-and-test ()
  (compile-and-load)
  (mapc (lambda (file)
          (prove:run file))
        *test-files*))

(compile-and-test)

; now type (use-package 'appl) to get the symbols
