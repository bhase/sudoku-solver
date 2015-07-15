(defpackage sudoku-solver-test
  (:use :cl
        :prove
        :sudoku-solver))

(in-package :sudoku-solver-test)

(defun generate-board-rows ()
  (make-array (list sudoku-solver::*sudoku-size* sudoku-solver::*sudoku-size*) :initial-contents
              (loop for i from 1 to sudoku-solver::*sudoku-size* collect
                    (loop for j from 1 to sudoku-solver::*sudoku-size* collect (list j)))))

(plan 11)

;; The internal method row delivers the array indices belonging
;; to the row of this cell index. Although it is an implementation detail
;; I consider it important enough to test.
(is (sudoku-solver::row 1 2) '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5) (1 6) (1 7) (1 8)))
(is (sudoku-solver::row 7 4) '((7 0) (7 1) (7 2) (7 3) (7 4) (7 5) (7 6) (7 7) (7 8)))

;; The internal method column delivers the array indices belonging
;; to the column of this cell index.
(is (sudoku-solver::column 1 2) '((0 2) (1 2) (2 2) (3 2) (4 2) (5 2) (6 2) (7 2) (8 2)))
(is (sudoku-solver::column 6 0) '((0 0) (1 0) (2 0) (3 0) (4 0) (5 0) (6 0) (7 0) (8 0)))

;; The internal method box delivers the array indices belonging
;; to the box (3x3 square) of this cell index.
(is (sudoku-solver::box 1 2) '((0 0) (0 1) (0 2) (1 0) (1 1) (1 2) (2 0) (2 1) (2 2)))
(is (sudoku-solver::box 0 0) '((0 0) (0 1) (0 2) (1 0) (1 1) (1 2) (2 0) (2 1) (2 2)))
(is (sudoku-solver::box 8 8) '((6 6) (6 7) (6 8) (7 6) (7 7) (7 8) (8 6) (8 7) (8 8)))
(is (sudoku-solver::box 3 6) '((3 6) (3 7) (3 8) (4 6) (4 7) (4 8) (5 6) (5 7) (5 8)))

;; the internal methods should be able to deal with different sizes
;; as long as it is squared
(subtest "Changing *sudoku-size* to 4"
         (plan 4)
         (let ((sudoku-solver::*sudoku-size* 4))
           (is (sudoku-solver::row 1 2) '((1 0) (1 1) (1 2) (1 3)))
           (is (sudoku-solver::column 1 2) '((0 2) (1 2) (2 2) (3 2)))
           (is (sudoku-solver::box 1 2) '((0 2) (0 3) (1 2) (1 3)))
           (is-print (display (generate-board-rows))
"
+-----+-----+
| 1 1 | 1 1 |
| 2 2 | 2 2 |
+-----+-----+
| 3 3 | 3 3 |
| 4 4 | 4 4 |
+-----+-----+"))

         (finalize))

(subtest "Changing *sudoku-size* to 16"
         (plan 3)
         (let ((sudoku-solver::*sudoku-size* 16))
           (is (length (sudoku-solver::row 1 2)) 16)
           (is (length (sudoku-solver::column 1 2)) 16)
           (is (length (sudoku-solver::box 1 2)) 16))
         (finalize))

(is-print (display (generate-board-rows))
"
+-------+-------+-------+
| 1 1 1 | 1 1 1 | 1 1 1 |
| 2 2 2 | 2 2 2 | 2 2 2 |
| 3 3 3 | 3 3 3 | 3 3 3 |
+-------+-------+-------+
| 4 4 4 | 4 4 4 | 4 4 4 |
| 5 5 5 | 5 5 5 | 5 5 5 |
| 6 6 6 | 6 6 6 | 6 6 6 |
+-------+-------+-------+
| 7 7 7 | 7 7 7 | 7 7 7 |
| 8 8 8 | 8 8 8 | 8 8 8 |
| 9 9 9 | 9 9 9 | 9 9 9 |
+-------+-------+-------+")

(finalize)
