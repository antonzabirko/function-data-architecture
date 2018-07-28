;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exam2--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural

; Problem 1:
; 
; Consider the above data definition for the age of a person.
; 
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).


;; Age -> Boolean
;; returns true if the age is [13, 19]
(check-expect (teenager? 10) false)
(check-expect (teenager? 17) true)

; (define (teenager? a) false)   ; Stub
;<use template from Age>
(define (teenager? a)
  (<= 13 a 19))

; Problem 2:
; 
; Design a data definition called MonthAge to represent a person's age
; in months.


;; MonthAge is Natural
;; interp. the age of a person in months
(define M0 12)
(define M1 1350)
#;
(define (fn-for-monthage m)
  (... m))

;; Template rules used:
;;  - atomic non-distinct: Natural

; Problem 3:
; 
; Design a function called months-old that takes a person's age in years 
; and yields that person's age in months.
; 


;; Age -> MonthAge
;; returns the age in terms of months
(check-expect (months-old 1) 12)
(check-expect (months-old 50) 600)

; (define (months-old a) 50)       ; Stub
;<use template from Age>
(define (months-old a)
  (* a 12))

; Problem 4:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
;   - if they are dead (which is shockingly poor health)
;   - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character.  The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.


;; Data Definitions:

;; Health is one of:
;;  - Number
;;  - "dead"
;; interp. a character is either dead or has extra lives
(define H0 5)
(define H1 0)
(define H2 "dead")
#;
(define (fn-for-health h)
  (cond [(number? h) (... h)]
        [else (...)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Number
;;  - atomic distinct: "dead"

;; Function Definitions:

;; Health -> Health
;; returns Health as Health +1; increases the "lives" in Health by one
(check-expect (increase-health 5) 6)
(check-expect (increase-health 0) 1)
(check-expect (increase-health "dead") "dead")

; (define (increase-health h) 5)     ; Stub
;<use template from Health>

(define (increase-health h)
  (cond [(number? h) (+ h 1)]
        [else "dead"]))
