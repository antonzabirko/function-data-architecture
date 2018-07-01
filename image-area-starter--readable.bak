;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-area-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;; image-area-starter.rkt

; 
; PROBLEM:
; 
; DESIGN a function called image-area that consumes an image and produces the 
; area of that image. For the area it is sufficient to just multiple the image's 
; width by its height.  Follow the HtDF recipe and leave behind commented 
; out versions of the stub and template.
; 


;; Image -> Natural
;; produce the width * height (area) of a given image
(check-expect (image-area (square 10 "solid" "red")) 100)

;(define (image-area img) 0)

;(define (image-area img)
;  (... img))

(define (image-area img)
  (* (image-width img) (image-height img)))