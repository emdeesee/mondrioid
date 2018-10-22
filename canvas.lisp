;;;; canvas.lisp
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


(in-package :mondrioid)

(defparameter *canvas-width* 512)
(defparameter *canvas-height* 512)
(defparameter *canvas-background* :black)
(defparameter *canvas-line-thickness* 4)

(defmacro with-canvas ((widget) &body body)
  `(ltk:with-ltk ()
     (let ((,widget (make-instance 'ltk:canvas
                     :master nil
                     :height *canvas-height*
                     :width *canvas-width*
                     :background *canvas-background*)))
       ,@body
       (ltk:pack ,widget))))

(defun make-background (canvas &key (color :white))
  (let ((rectangle (ltk:create-rectangle canvas
                                         *canvas-line-thickness*
                                         *canvas-line-thickness*
                                         (- *canvas-width* *canvas-line-thickness*)
                                         (- *canvas-height* *canvas-line-thickness*))))
    (ltk:itemconfigure canvas rectangle :fill color)))

(defun make-block (canvas x0 y0 x1 y1 &optional (color :black))
  (let ((rectangle (ltk:create-rectangle canvas x0 y0 x1 y1)))
    (ltk:itemconfigure canvas rectangle :fill color)
    (ltk:itemconfigure canvas rectangle :outline color)))

(defun make-horizontal-line (canvas y)
  ;; lines are just long skinny rectangles
  (make-block canvas 0 y *canvas-width* (+ y *canvas-line-thickness*)))

(defun make-vertical-line (canvas x)
  ;; lines are just long skinny rectangles
  (make-block canvas x 0 (+ x *canvas-line-thickness*) *canvas-height*))
