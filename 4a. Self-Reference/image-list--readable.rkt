;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-list--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; image-list-starter.rkt

;; =================
;; Constants:

(define RECTANGLE (rectangle 20 10 "solid" "blue"))
(define CIRCLE (circle 20 "solid" "red"))


;; =================
;; Data definitions:

;; ListOfImage is one of:
;;  - empty
;;  - (cons Image ListOfImage)
;; interp. a list of images
(define I0 empty)
(define I1 (cons RECTANGLE empty))
(define I2 (cons RECTANGLE (cons CIRCLE empty)))
#;
(define (fn-for-loi loi)
  (cond [(empty? (first loi)) empty]
        [else (... (first loi)
                   (fn-for-loi (rest loi)))]))

;; Template Rules Used:
;;  - one of: 2 cases
;;  - atomic-distinct: empty:
;;  - compound: (cons Image ListOfImage)
;;  - self-reference: (rest loi) is ListOfImage

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of images. Call it ListOfImage. 
; 



;; =================
;; Functions:

;; ListOfImage -> Integer
;; produce the sum of the area of each image in a list (h*w)
;;   empty is 0
(check-expect (area-sum empty) 0)
(check-expect (area-sum (cons RECTANGLE empty)) (+ 200 0))
(check-expect (area-sum (cons RECTANGLE (cons CIRCLE empty))) (+ 200 (+ 1600 0)))

; (define (area-sum loi) 500)  ; Stub
; <Using template from ListOfImage>
(define (area-sum loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi)) (image-height (first loi)))
            (area-sum (rest loi)))]))

; 
; PROBLEM B:
; 
; Design a function that consumes a list of images and produces a number 
; that is the sum of the areas of each image. For area, just use the image's 
; width times its height.
; 

