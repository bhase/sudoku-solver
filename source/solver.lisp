(defpackage sudoku-solver
  (:use :cl))

(in-package #:sudoku-solver)

(defparameter *sudoku-size* 9)

;(export 'add)
(defun row (x y)
  (loop for i to (- *sudoku-size* 1) collect `(,x ,i)))

(defun column (x y)
  (loop for i to (- *sudoku-size* 1) collect `(,i ,y)))

(defun box (x y)
  (let ((start-x (* 3 (truncate (/ x 3))))
        (start-y (* 3 (truncate (/ y 3)))))
    (loop for i from 0 below 3
          append (loop for j from 0 below 3
                        collect (list (+ start-x i) (+ start-y j))))))
