;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname less-than-five-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; less-than-five-starter.rkt

; 
; PROBLEM:
; 
; DESIGN function that consumes a string and determines whether its length is
; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
; of the stub and template.
; 


;; String -> Boolean
;; produces true if length of string is less than 5
(check-expect (less-than-five? "Hello there!") false)
(check-expect (less-than-five? "Hello") false)
(check-expect (less-than-five? "Hi") true)

;(define (less-than-five? str) true)

;(define (less-than-five? str)
;  (... str))

(define (less-than-five? str)
  (< (string-length str) 5))