;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; quidditch-starter.rkt

; 
; PROBLEM:
; 
; Imagine that you are designing a program that will keep track of
; your favorite Quidditch teams. (http://iqaquidditch.org/).
; 
; Design a data definition to represent a list of Quidditch teams. 
;    


;; =======================
;; Data Definitions:

;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings of my favorite Quidditch teams!
(define LOS0 empty)
(define LOS1 (cons "Harry Potter's Soyboys" empty))
(define LOS2 (cons "UBC" (cons "Harry Potter's Soyboys" empty)))
#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))

;; Template Rules Used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons String ListOfString)
;;  - 

; 
; PROBLEM:
; 
; We want to know whether your list of favorite Quidditch teams includes
; UBC! Design a function that consumes ListOfString and produces true if 
; the list includes "UBC".
; 
