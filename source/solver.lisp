(defpackage sudoku-solver
  (:use :cl))

(in-package #:sudoku-solver)

(export 'add)
(defun add (n1 n2)
  (+ n1 n2))
