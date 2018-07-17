;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1. Decreasing-image|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; decreasing-image-starter.rkt

;  PROBLEM:
;  
;  Design a function called decreasing-image that consumes a Natural n and produces an image of all the numbers 
;  from n to 0 side by side. 
;  
;  So (decreasing-image 3) should produce .


;; Natural -> Image
;; produce an image of all the numbers from n to 0 side-by-side
(check-expect (imagify 0) (text (number->string 0) 22 "black"))
(check-expect (imagify 1) (beside
                           (text (number->string 1) 22 "black")
                           (text (number->string 0) 22 "black")))

;(define (imagify n) (square 0 "solid" "white"))    ; Stub

(define (imagify n)
  (cond [(zero? n) (text (number->string 0) 22 "black")]
        [else
         (beside (text (number->string n) 22 "black")
                 (imagify (sub1 n)))]))