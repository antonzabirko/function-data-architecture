;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname student--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; student-starter.rkt

;; =================
;; Data definitions:

(define-struct student (name grade allergies))
;; Student is (make-student String Natural[1, 12] Boolean)
;; interp. creates a student object
;;     name is the name of the student
;;     grade is the grade of the student [1, 12]
;;     allergies is true if the student has allergies; false if they do not have allergies

(define S0 (make-student "Alpha" 10 true))
(define S1 (make-student "Beta" 12 false))
(define S2 (make-student "Charlie" 5 true))
(define S3 (make-student "Delta" 6 false))

#;
(define (fn-for-student s)
  (... (student-name s)        ;String
       (student-grade s)       ;Natural[1,12]
       (student-allergies s))) ;Boolean

;; Template rules used:
;;  - compound: 3 fields

; 
; PROBLEM A:
; 
; Design a data definition to help a teacher organize their next field trip. 
; On the trip, lunch must be provided for all students. For each student, track 
; their name, their grade (from 1 to 12), and whether or not they have allergies.
; 


;; =================
;; Functions:

;; Student -> Boolean
;; produces true if student has allergies and should be added to a special list
(check-expect (add-list? S0) false)
(check-expect (add-list? S1) false)
(check-expect (add-list? S2) true)
(check-expect (add-list? S3) false)

;(define (add-list? s) true)     ;Stub
;<use template from student>

(define (add-list? s)
  (and (<= (student-grade s) 6)
      (student-allergies s)))

; 
; PROBLEM B:
; 
; To plan for the field trip, if students are in grade 6 or below, the teacher 
; is responsible for keeping track of their allergies. If a student has allergies, 
; and is in a qualifying grade, their name should be added to a special list. 
; Design a function to produce true if a student name should be added to this list.
; 

