(defpackage sudoku-solver
  (:use :cl))

(in-package #:sudoku-solver)

(defparameter *sudoku-size* 9)

;(export 'add)
(defun row (x y)
  (loop for i to (- *sudoku-size* 1) collect `(,x ,i)))

(defun column (x y)
  (loop for i to (- *sudoku-size* 1) collect `(,i ,y)))
