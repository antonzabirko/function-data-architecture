;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname water-balloon--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; water-balloon-starter.rkt

; PROBLEM:
; 
; In this problem, we will design an animation of throwing a water balloon.  
; When the program starts the water balloon should appear on the left side 
; of the screen, half-way up.  Since the balloon was thrown, it should 
; fly across the screen, rotating in a clockwise fashion. Pressing the 
; space key should cause the program to start over with the water balloon
; back at the left side of the screen. 
; 
; NOTE: Please include your domain analysis at the top in a comment box. 
; 
; Use the following images to assist you with your domain analysis:
; 
; 
; 1)
; 2).
; .
; 3)
; .
; 4)
; 
; .
;     
; 
; Here is an image of the water balloon:
; (define WATER-BALLOON.)
; 
; 
; 
; NOTE: The rotate function wants an angle in degrees as its first 
; argument. By that it means Number[0, 360). As time goes by your balloon 
; may end up spinning more than once, for example, you may get to a point 
; where it has spun 362 degrees, which rotate won't accept. 
; 
; The solution to that is to use the modulo function as follows:
; 
; (rotate (modulo ... 360) (text "hello" 30 "black"))
; 
; where ... should be replaced by the number of degrees to rotate.
; 
; NOTE: It is possible to design this program with simple atomic data, 
; but we would like you to use compound data.


(require 2htdp/image)
(require 2htdp/universe)

;; Spinning Balloon

;; =================
;; Constants:
(define WIDTH 800)
(define HEIGHT 500)
(define CTR-Y (/ HEIGHT 2))
(define BALLOON_IMG .)
(define MTS (empty-scene HEIGHT WIDTH))


;; =================
;; Data definitions:

(define-struct balloon (x angle))
;; Balloon is (make-balloon (Integer Natural[0, 360]))
;; interp. x is the x-position of the balloon and angle is the spinning angle of the balloon
(define B0 (make-balloon 0 0))
(define B1 (make-balloon 50 180))
(define B2 (make-balloon 150 360))
#;
(define (fn-for-balloon bal)
  (... (balloon-x bal)
       (balloon-angle bal)))

;; =================
;; Functions:

;; Balloon -> Balloon
;; start the world with (main (make-balloon 0 0))
;; 
(define (main bal)
  (big-bang bal                          ; Balloon
            (on-tick   tock)             ; Balloon -> Balloon
            (to-draw   render)           ; Balloon -> Image
            (on-key    handle-key)))     ; Balloon KeyEvent -> Balloon

;; Balloon -> Balloon
;; produce the next balloon with an updated pos and updated angle
;;   x-pos increases by 5 each tick and angle increases by 20
(check-expect (tock (make-balloon 0 30)) (make-balloon 5 50))       ; Normal case.

(check-expect (tock (make-balloon 90 350)) (make-balloon 95 10))    ; 360 -> 0 angle reset case.

; (define (tock bal) (make-balloon 0 0))            ; Stub
; <Use template from Balloon>
(define (tock bal)
  (make-balloon (+ (balloon-x bal) 5) (modulo (+ (balloon-angle bal) 20) 360)))


;; Balloon -> Image
;; render the balloon
(check-expect (render (make-balloon 0 0)) (place-image (rotate 0 BALLOON_IMG) 0 CTR-Y MTS))
(check-expect (render (make-balloon 100 0)) (place-image (rotate 0 BALLOON_IMG) 100 CTR-Y MTS))
 
; (define (render bal) MTS)      ; Stub
; <Use function from Balloon>
(define (render bal)
  (place-image (rotate (balloon-angle bal) BALLOON_IMG) (balloon-x bal) CTR-Y MTS))

;; Balloon KeyEvent -> Balloon
;; reset the x-position of the balloon when the spacebar is pressed
(check-expect (handle-key (make-balloon 0 0) " ") (make-balloon 0 0))    ; All cases reset to 0, 0

(define (handle-key bal ke)
  (make-balloon 0 0))

