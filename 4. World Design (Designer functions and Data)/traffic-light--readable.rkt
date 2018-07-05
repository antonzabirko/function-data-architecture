;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a traffic light. 
; 
; Your program should show a traffic light that is red, then green, 
; then yellow, then red etc. For this program, your changing world 
; state data definition should be an enumeration.
; 
; Here is what your program might look like if the initial world 
; state was the red traffic light:
; .
; Next:
; .
; Next:
; .
; Next is red, and so on.
; 
; To make your lights change at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
; then big-bang will wait 1 second between calls to next-color.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles. 
; 


(require 2htdp/image)
(require 2htdp/universe)



;; This program displays a flashing traffic light.


;; =================
;; Constants:

(define HEIGHT 600)
(define WIDTH 1200)
(define MTS (empty-scene WIDTH HEIGHT "black"))
(define X-POS (/ WIDTH 2))
(define Y-POS (/ HEIGHT 2))
(define RED (place-image (above (circle 100 "solid" "red") (circle 100 "outline" "yellow") (circle 100 "outline" "green")) X-POS Y-POS MTS))
(define YELLOW (place-image (above (circle 100 "outline" "red") (circle 100 "solid" "yellow") (circle 100 "outline" "green")) X-POS Y-POS MTS))
(define GREEN (place-image (above (circle 100 "outline" "red") (circle 100 "outline" "yellow") (circle 100 "solid" "green")) X-POS Y-POS MTS))


;; =================
;; Data definitions:

;; TrafficLight is one of:
;;  - "red"
;;  - "yellow"
;;  - "green"
;; interp. the color of a traffic light
(define TL0 "red")
(define TL1 "yellow")
(define TL2 "green")
#;
(define (fn-for-traffic-light tl)
  (cond [(string=? tl "red") (...)]
        [(string=? tl "yellow") (...)]
        [(string=? tl "green") (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"


;; =================
;; Functions:

;; TrafficLight -> TrafficLight
;; start the world with (main "red")
;; 
(define (main tl)
  (big-bang tl                       ; TrafficLight
            (on-tick   tock 1)       ; TrafficLight -> TrafficLight
            (to-draw   render)))     ; TrafficLight -> Image

;; TrafficLight -> TrafficLight
;; produce the next traffic light color
(define (tock tl)
  (cond [(string=? tl "red")    "green"]
        [(string=? tl "yellow") "red"]
        [else "yellow"]))


;; TrafficLight -> Image
;; render the next traffic light
(define (render tl)
  (cond [(string=? tl "red") RED]
        [(string=? tl "yellow") YELLOW]
        [(string=? tl "green") GREEN]))