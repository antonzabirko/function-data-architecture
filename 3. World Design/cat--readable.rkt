;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cat--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; cat-starter.rkt

; 
; PROBLEM:
; 
; Use the How to Design Worlds recipe to design an interactive
; program in which a cat starts at the left edge of the display 
; and then walks across the screen to the right. When the cat
; reaches the right edge it should just keep going right off 
; the screen.
; 
; Once your design is complete revise it to add a new feature,
; which is that pressing the space key should cause the cat to
; go back to the left edge of the screen. When you do this, go
; all the way back to your domain analysis and incorporate the
; new feature.
; 
; To help you get started, here is a picture of a cat, which we
; have taken from the 2nd edition of the How to Design Programs 
; book on which this course is based.
; 
; .
; 


(require 2htdp/image)
(require 2htdp/universe)

;; A cat that walks from left to right across the screen.

;; =================
;; Constants:

(define WIDTH 600)
(define HEIGHT 400)
(define CTR-Y (/ HEIGHT 2))
(define SPEED 3)
(define MTS (empty-scene WIDTH HEIGHT))
(define CAT-IMG .)

;; =================
;; Data definitions:

;; Cat is Number
;; interp. this is the x-pos of the cat in screen coordinates
(define C0 0)
(define C1 (/ WIDTH 2))
(define C2 WIDTH)
#;
(define (fn-for-cat c)
  (... c))

;; Template rules used:
;; - atomic non-distinct: Number


;; =================
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;; 
(define (main c)
  (big-bang c                           ; Cat
            (on-tick   advance-cat)     ; Cat -> Cat
            (to-draw   render)          ; Cat -> Image
            (on-mouse  handle-mouse)    ; Cat Integer Integer MouseEvent -> Cat
            (on-key    handle-key)))    ; Cat KeyEvent -> Cat


;; Cat -> Cat
;; produce the next cat by advancing it by SPEED pixels to the right
(check-expect (advance-cat (/ WIDTH 2)) (+ (/ WIDTH 2) SPEED))

; (define (advance-cat c) 0)          ; Stub
;<use template from Cat>
(define (advance-cat c)
  (+ c SPEED))


;; Cat -> Image
;; render the cat image on the appropriate place on MTS 
(check-expect (render (/ WIDTH 2)) (place-image CAT-IMG (/ WIDTH 2) CTR-Y MTS))

; (define (render c) MTS)             ; Stub
;<use template from Cat>
(define (render c)
  (place-image CAT-IMG c CTR-Y MTS))

;; Cat KeyEvent -> Cat
;; reset cat to left edge when space key is pressed
(check-expect (handle-key 0 " ") 0)
(check-expect (handle-key 10 " ") 0)
(check-expect (handle-key 0 "a") 0)
(check-expect (handle-key 10 "a") 10)

;(define (handle-key c ke) 0)

(define (handle-key c ke)
  (cond [(key=? ke " ") 0]
        [else c]))

;; Cat Integer Integer MouseEvent -> Cat
;; move the cat to the x-pos of the mouse click
(check-expect (handle-mouse WIDTH 500 50 "button-down") 500)
(check-expect (handle-mouse 0 300 50 "button-down") 300)

; (define (handle-mouse cat intA intB mouse) 50)

(define (handle-mouse cat intA intB mouse)
  (cond [(mouse=? mouse "button-down") intA]
        [else cat]))