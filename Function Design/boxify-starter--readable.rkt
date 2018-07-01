;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boxify-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; boxify-starter.rkt

; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes an image, 
; and appears to put a box around it. Note that you can do this by creating an "outline" 
; rectangle that is bigger than the image, and then using overlay to put it on top of the image. 
; For example:
; 
; (boxify (ellipse 60 30 "solid" "red")) should produce .
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 


;; Image -> Image
;; produces the given image with a box around it
(check-expect (boxify (rectangle 10 10 "solid" "red")) (overlay (rectangle 10 10 "outline" "black") (rectangle 10 10 "solid" "red")))
(check-expect (boxify (ellipse 50 80 "solid" "red")) (overlay (rectangle 50 80 "outline" "black") (ellipse 50 80 "solid" "red")))

;(define (boxify img) img)

;(define (boxify img)
;  (... img))

(define (boxify img)
  (overlay (rectangle (image-width img) (image-height img) "outline" "black") img))