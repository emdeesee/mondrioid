;;;; mondrioid.lisp
;; This file is part of mondrioid.
;;
;; Mondrioid is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; any later version.
;;
;; mondrioid is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with mondrioid.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;; Copyright (c) 2018 Michael Cornelius <michael@ninthorder.com>


(in-package #:mondrioid)

(defparameter *red* "#cc1804")
(defparameter *yellow* "#e5d15e")
(defparameter *blue* "#005588")

(defparameter *colors* (list *red* *yellow* *blue*))

(defun number-of-lines (&key (at-least 2) (at-most 8) (random-state *random-state*))
  (+ at-least (random (- at-most at-least) random-state)))

(defun find-block (hlines vlines)
  (let* ((vlines-len (length vlines))
         (i (random vlines-len))
         (hlines-len (length hlines))
         (j (random hlines-len)))
    (list
     (+ (nth i vlines) *canvas-line-thickness*)
     (+ (nth j hlines) *canvas-line-thickness*)
     (let ((next (1+ i)))
       (if (= next vlines-len)
           (- *canvas-width* *canvas-line-thickness*)
           (nth next vlines)))
     (let ((next (1+ j)))
       (if (= next hlines-len)
           (- *canvas-height* *canvas-line-thickness*)
           (nth next hlines))))))

(defun mondrioid (&key (random-state *random-state*) (frame t))
  (with-canvas (c)
    (when frame (make-background c))
    (let ((hlines (remove-duplicates
                   (sort
                    (loop :repeat (number-of-lines :random-state random-state)
                          :collect (random *canvas-height* random-state))
                    #'<)))
          (vlines (remove-duplicates
                   (sort
                    (loop :repeat (number-of-lines :random-state random-state)
                          :collect (random *canvas-width* random-state))
                    #'<))))
      (dolist (y hlines) (make-horizontal-line c y))
      (dolist (x vlines) (make-vertical-line c x))
      (loop :repeat (+ 3 (random 3 random-state))
            :do (apply #'make-block
                       (cons c
                             (append (find-block hlines vlines)
                                     (list (nth (random (length *colors*)) *colors*)))))))))
