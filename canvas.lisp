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

(defparameter *canvas-x* 512)
(defparameter *canvas-y* 512)
(defparameter *canvas-background* :white)

(defmacro with-canvas ((widget) &body body)
  `(ltk:with-ltk ()
     (let ((,widget (make-instance 'ltk:canvas
                     :master nil
                     :height *canvas-height*
                     :width *canvas-width*
                     :background *canvas-background*)))
       ,@body
       (ltk:pack ,widget))))
