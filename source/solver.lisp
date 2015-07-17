(defpackage sudoku-solver
  (:use :cl))

(in-package #:sudoku-solver)

(defparameter *sudoku-size* 9)

;| 3 3 3 | 3 3 3 | 3 3 3 |
;+-------+-------+-------+
;| 4 4 4 | 4 4 4 | 4 4 4 |
;
(export 'display)
(defun display (board)
  (let* ((box-size (sqrt *sudoku-size*))
         (line (format nil "~%~v@{~A~:*~}+" box-size
                       (format nil "+~v,,,v<~>" (1+ (* 2 box-size)) #\-)))
         (format-string (format nil "~~%~~{~~<| ~v@{~A ~:*~}~~>~~}|" box-size "~x")))
    (dotimes (k *sudoku-size*)
      (when (eql 0 (mod k box-size))
        (princ line))
      (format t format-string (get-row board k)))
    (princ line)))

(defun get-row (board index)
  (mapcar (lambda (e)
            (if (eq 1 (length e))
              (car e)
              #\.))
          (loop for i below *sudoku-size*
                collect (aref board i index))))

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
