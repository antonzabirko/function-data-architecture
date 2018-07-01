;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tall-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;; tall-starter.rkt

; 
; PROBLEM:
; 
; DESIGN a function that consumes an image and determines whether the 
; image is tall.
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 


;; Image -> Boolean
;; produces true if the image's height is greater than its' width
(check-expect (tall? (rectangle 20 10 "solid" "red")) false)
(check-expect (tall? (rectangle 10 20 "solid" "red")) true)
(check-expect (tall? (rectangle 10 10 "solid" "red")) false)

;(define (tall? img) true)

;(define (tall? img)
;  (... img))

(define (tall? img)
  (> (image-height img) (image-width img)))