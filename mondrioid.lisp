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

(defun number-of-lines (&key (at-least 2) (at-most 8) (random-state *random-state*))
  (+ at-least (random (- at-most at-least) random-state)))

(defun mondrioid (&key (random-state *random-state*) (frame t))
  (with-canvas (c)
    (when frame (make-background c))
    (loop :repeat (number-of-lines :random-state random-state)
          :do (make-horizontal-line c (random *canvas-height* random-state)))
    (loop :repeat (number-of-lines :random-state random-state)
          :do (make-vertical-line c (random *canvas-width* random-state)))))
