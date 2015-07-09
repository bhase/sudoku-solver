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
  (let* ((box-size (sqrt *sudoku-size*))
         (start-x (* box-size (truncate (/ x box-size))))
         (start-y (* box-size (truncate (/ y box-size)))))
    (loop for i from 0 below box-size
          append (loop for j from 0 below box-size
                        collect (list (+ start-x i) (+ start-y j))))))
