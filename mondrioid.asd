;;;; mondrioid.asd
;;
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


(asdf:defsystem #:mondrioid
  :description "Create images evocative of the work of Piet Mondrian."
  :author "Michael Cornelius <michael@ninthorder.com>"
  :license  "GPL-3.0-or-later"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "mondrioid")))
