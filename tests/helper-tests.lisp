(defpackage sudoku-solver-test
  (:use :cl
        :prove
        :sudoku-solver))

(in-package :sudoku-solver-test)

(plan 5)

(ok (not (find 4 '(1 2 3))))
 

(finalize)
