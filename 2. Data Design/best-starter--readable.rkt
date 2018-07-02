;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname best-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; best-starter.rkt

; 
; PROBLEM:
; 
; Using the CityName data definition below design a function
; that produces true if the given city is the best in the world. 
; (You are free to decide for yourself which is the best city 
; in the world.)
; 


;; Data Definitions:

;; CityName is String
;; interp. the string titles the city
(define CN1 "Vancouver")
(define CN2 "New York")
#;
(define (fn-for-cityName cn)
  (... cn))

;; Template rules used:
;;  - atomic non-distinct: String


;; Functions:

;; CityName -> Boolean
;; produces true if the CityName is "New York"
(check-expect (best-city? CN1) false)
(check-expect (best-city? CN2) true)

; (define (best-city? cn) true)    ; Stub

; (define (best-city? cn)          ; Template
;   (... cn))                      ; Template

(define (best-city? cn)
  (equal? cn CN2))