;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cowabunga--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; 
; PROBLEM:
; 
; As we learned in the cat world programs, cats have a mind of their own. When they 
; reach the edge they just keep walking out of the window.
; 
; Cows on the other hand are docile creatures. They stay inside the fence, walking
; back and forth nicely.
; 
; Design a world program with the following behaviour:
;    - A cow walks back and forth across the screen.
;    - When it gets to an edge it changes direction and goes back the other way
;    - When you start the program it should be possible to control how fast a
;      walker your cow is.
;    - Pressing space makes it change direction right away.
;    
; To help you here are two pictures of the right and left sides of a lovely cow that 
; was raised for us at Brown University.
; 
; .     .
; 
; Once your program works here is something you can try for fun. If you rotate the
; images of the cow slightly, and you vary the image you use as the cow moves, you
; can make it appear as if the cow is waddling as it walks across the screen.
; 
; Also, to make it look better, arrange for the cow to change direction when its
; nose hits the edge of the window, not the center of its body.
; 


(require 2htdp/image)
(require 2htdp/universe)

;; My world program  (make this more specific)

;; =================
;; Constants:
(define HEIGHT 600)
(define WIDTH 800)
(define CTR-Y (/ HEIGHT 2))
(define COW_LEFT .)
(define COW_RIGHT .)
(define MTS (empty-scene WIDTH HEIGHT))


;; =================
;; Data definitions:

(define-struct cow (x dx))
;; Cow is (make-cow Natural[0, WIDTH] Integer)
;; interp. (make-cow x dx) x is the x-coordinate of the cow's current position in pixels
;;         dx is the velocity of the cow in pixels per tick
(define C0 (make-cow 0 10))      ; Starting at 0, going left -> right
(define C1 (make-cow 50 -5))     ; STarting at 50, going right -> left
(define C2 (make-cow WIDTH -5))
#;
(define (fn-for-cow c)
  (... (cow-x c)          ; Natural[0, WIDTH]
       (cow-dx c)))       ; Integer


;; =================
;; Functions:

;; Cow -> Cow
;; start the world with ...
;; 
(define (main c)
  (big-bang c                           ; Cow
            (on-tick   next-cow)        ; Cow -> Cow
            (to-draw   render)          ; Cow -> Image
            (on-key    handle-key)))    ; Cow KeyEvent -> Cow


;; Cow -> Cow
;; produce the next Cow; bounce the cow off the edges
(check-expect (next-cow (make-cow 20 3)) (make-cow (+ 20 3) 3))        ;middle
(check-expect (next-cow (make-cow 20 -3)) (make-cow (- 20 3) -3))

(check-expect (next-cow (make-cow (- WIDTH 3) 3)) (make-cow WIDTH 3))  ;reaches edge
(check-expect (next-cow (make-cow 3          -3)) (make-cow 0    -3))

(check-expect (next-cow (make-cow (- WIDTH 2) 3)) (make-cow WIDTH -3)) ;tries to pass the edge
(check-expect (next-cow (make-cow 2          -3)) (make-cow 0      3))

;(define (next-cow c) c)   ;stub
;<took template from cow>
(define (next-cow c)
  (cond [(> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow WIDTH (- (cow-dx c)))]          ; Handle right edge case.
        [(< (+ (cow-x c) (cow-dx c)) 0) (make-cow 0 (- (cow-dx c)))]                  ; Handle left  edge case.
        [else (make-cow (+ (cow-x c) (cow-dx c)) (cow-dx c))]))


;; Cow -> Image
;; render MTS with the cow in the proper place
(check-expect (render (make-cow 0 5))
              (place-image COW_RIGHT 0 CTR-Y MTS))
(check-expect (render (make-cow 100 -5))
              (place-image COW_LEFT 100 CTR-Y MTS))


; (define (render c) MTS)         ; Stub
; <using template from cow>
(define (fn-for-cow c)
  (... (cow-x c)          ; Natural[0, WIDTH]
       (cow-dx c)))       ; Integer

(define (render c)
  (place-image (choose-image c) (cow-x c) CTR-Y MTS))


;; Cow -> Image
;; chooses either the left cow image if the cow has a negative velocity
;;         or the right cow image if the cow has a positive velocity
(check-expect (choose-image (make-cow 10 3)) COW_RIGHT)
(check-expect (choose-image (make-cow 50 -4)) COW_LEFT)
; (define (choose-image c) COW_RIGHT)        ; Stub
; <use template from cow>
(define (choose-image c)
  (if  (> (cow-dx c) 0)
       COW_RIGHT
       COW_LEFT))


;; Cow -> Cow
;; change the direction of the cow when the user presses spacebar
(define (handle-key c ke)
  (cond [(key=? " " ke) (make-cow (cow-x c) (- (cow-dx c)))]))