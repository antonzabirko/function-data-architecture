;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exam-image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;; Image Image -> Boolean
;; produces true if the first image is larger (in terms of area) than the second
(check-expect (larger? (rectangle 10 10 "solid" "red") (rectangle 100 100 "solid" "red")) false)
(check-expect (larger? (rectangle 10 10 "solid" "red") (rectangle 10 10 "solid" "red")) false)
(check-expect (larger? (rectangle 100 100 "solid" "red") (rectangle 10 10 "solid" "red")) true)

;(define (larger? firstImg lastImg) true)  ; stub

;(define (larger? firstImg lastImg)        ; template
;  (... firstImg lastImg))

(define (larger? firstImg lastImg)
  (> (* (image-height firstImg) (image-width firstImg)) (* (image-height lastImg) (image-width lastImg))))
