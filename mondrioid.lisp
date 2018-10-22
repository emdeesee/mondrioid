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

(defparameter *colors* (list ))

(defun number-of-lines (&key (at-least 2) (at-most 8) (random-state *random-state*))
  (+ at-least (random (- at-most at-least) random-state)))

(defun mondrioid (&key (random-state *random-state*) (frame t))
  (with-canvas (c)
    (when frame (make-background c))
    (let ((hlines (loop :repeat (number-of-lines :random-state random-state)
                        :collect (random *canvas-height* random-state)))
          (vlines (loop :repeat (number-of-lines :random-state random-state)
                        :collect (random *canvas-width* random-state))))
      (dolist (y hlines) (make-horizontal-line c y))
      (dolist (x vlines) (make-vertical-line c x)))))
