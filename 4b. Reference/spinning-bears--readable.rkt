;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spinning-bears--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; spinning-bears-starter.rkt

(require 2htdp/image)
(require 2htdp/universe)

; PROBLEM:
; 
; In this problem you will design another world program. In this program the changing 
; information will be more complex - your type definitions will involve arbitrary 
; sized data as well as the reference rule and compound data. But by doing your 
; design in two phases you will be able to manage this complexity. As a whole, this problem 
; will represent an excellent summary of the material covered so far in the course, and world 
; programs in particular.
; 
; This world is about spinning bears. The world will start with an empty screen. Clicking
; anywhere on the screen will cause a bear to appear at that spot. The bear starts out upright,
; but then rotates counterclockwise at a constant speed. Each time the mouse is clicked on the 
; screen, a new upright bear appears and starts spinning.
; 
; So each bear has its own x and y position, as well as its angle of rotation. And there are an
; arbitrary amount of bears.
; 
; To start, design a world that has only one spinning bear. Initially, the world will start
; with one bear spinning in the center at the screen. Clicking the mouse at a spot on the
; world will replace the old bear with a new bear at the new spot. You can do this part 
; with only material up through compound. 
; 
; Once this is working you should expand the program to include an arbitrary number of bears.
; 
; Here is an image of a bear for you to use: .

;; ====================================
;;      Program: 'Spinning Bears'
;; ====================================
;;   - Sidenote: this bear is pretty creepy ._.


;; ===================
;;      Constants:
;; ===================

(define BEAR .)
(define WIDTH 1200)
(define HEIGHT 800)
(define MTS (empty-scene WIDTH HEIGHT))
(define SPEED 20)



;; ===================
;;  Data definitions:
;; ===================


;; /*===================================================*\
;;
(define-struct position (x y))
;; Position is (make-position Integer Integer)
;; interp. x: the x-pos coordinate on the MTS
;;         y: the y-pos coordinate on the MTS
(define P1 (make-position 0 0))
(define P2 (make-position 1500 -501))
#;
(define (fn-for-position pos)
  (...  (position-x pos)      ; Integer
        (position-y pos)))    ; Integer
;;
;; Template rules used:
;;  - compound: (make-position Integer Integer)
;;  - atomic non-distinct: Integer
;;  - atomic non-distinct: Integer
;;
;; \*===================================================*/


;; /*===================================================*\
;;
(define-struct bear (pos angle))
;; Bear is (make-bear Position Natural[0, 359)
;; interp. pos: the Position of the bear
;;         angle: the angle of the bear from 0 to 359
(define B1 (make-bear (make-position 0 0) 0))
(define B2 (make-bear (make-position 1500 -501) 173))
#;
(define (fn-for-bear be)
  (... (fn-for-position (bear-pos be))  ; Position
       (bear-angle be)))                ; Natural[0, 359)
;;
;; Template rules used:
;;  - compound: (make-bear Position Natural[0, 359))
;;  - reference: (bear-pos be)
;;  - atomic non-distinct: Natural[0, 359)
;;
;; \*===================================================*/


;; /*===================================================*\
;;
;; ListOfBear is one of:
;;  - empty
;;  - (cons Bear ListOfBear)
;; interp. a list of bears on the screen
(define LOB1 empty)
(define LOB2 (cons (make-bear (make-position 0 0) 0) empty))
(define LOB3 (cons (make-bear (make-position 0 0) 0) (cons (make-bear (make-position 1500 -501) 173) empty)))
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-bear (first lob))
              (fn-for-lob (rest lob)))]))
;;
;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - reference: (first lob)
;;  - self-reference: (rest lob) is ListOfBear
;;
;; \*===================================================*/



;; ===================
;;      Functions:
;; ===================


;; /*===================================================*\
;;
;; ListOfBear -> ListOfBear
;; start the world with (main empty) and click anywhere on the window that pops-up
;; 
(define (main lob)
  (big-bang lob                    ; ListOfBear
    (on-tick   update-bears)       ; ListOfBear -> ListOfBear
    (to-draw   render-bears)       ; ListOfBear -> Image
    (on-mouse  create-bear)))      ; ListOfBear Integer Integer MouseEvent -> ListOfBear
;;
;; \*===================================================*/


;; /*===================================================*\
;;
;; ListOfBear -> ListOfBear
;; produce the next ListOfBear
(check-expect (update-bears empty) empty)
(check-expect (update-bears (cons (make-bear (make-position 0 0) 0) empty)) (cons (make-bear (make-position 0 0) 20) empty))  ; Standard behaviour
(check-expect (update-bears (cons (make-bear (make-position 0 0) 0) (cons (make-bear (make-position 1500 -501) 350) empty)))  ; When the angle is >359
              (cons (make-bear (make-position 0 0) 20) (cons (make-bear (make-position 1500 -501) 10) empty)))
;(define (update-bears lob) empty)       ; Stub
;; <Using template from ListOfBear>
(define (update-bears lob)
  (cond [(empty? lob) empty]
        [else
         (cons (rotate-bear (first lob))
               (update-bears (rest lob)))]))
;;
;;
;; ========
;; rotate-bear is a helper for update-bears
;;
;; Bear -> Bear
;; rotate the given bear + SPEED degrees and return the said bear
(check-expect (rotate-bear (make-bear (make-position 0 0) 0)) (make-bear (make-position 0 0) 20))             ; Standard Behaviour
(check-expect (rotate-bear (make-bear (make-position -100 50) 350)) (make-bear (make-position -100 50) 10))    ; When the angle is >359
;(define (rotate-bear be) (make-bear (bear-pos be) (+ 15 (bear-angle be))))   ; Stub
;; <Using template from Bear>
(define (rotate-bear be)
  (make-bear (bear-pos be) (modulo (+ (bear-angle be) SPEED) 360)))                ; Natural[0, 359)
;;
;; ========
;;
;; \*===================================================*/


;; /*===================================================*\
;;
;; ListOfBear -> Image
;; render ListOfBear as all the Bears in the list onto an empty-scene
(check-expect (render-bears empty) MTS)
(check-expect (render-bears (cons (make-bear (make-position 100 100) 0) empty))
              (place-image BEAR 100 100 MTS))
(check-expect (render-bears (cons (make-bear (make-position 100 100) 0) (cons (make-bear (make-position 600 500) 350) empty)))
              (place-image BEAR 100 100
                           (place-image (rotate 350 BEAR) 600 500 MTS)))
;(define (render-bears lob) MTS)          ; Stub
; <Using template from ListOfBear>

(define (render-bears lob)
  (cond [(empty? lob) MTS]
        [else
         (render-bear-on (first lob) (render-bears (rest lob)))]))
;;
;;
;; ========
;; render-bear-on is a helper for render-bears
;;
;; Bear Image -> Image
;; places a bear on its' proper location upon the MTS
(check-expect (render-bear-on (make-bear (make-position 0 0) 0) MTS)
              (place-image (rotate 0 BEAR) 0 0 MTS))
(check-expect (render-bear-on (make-bear (make-position 50 50) 90) MTS)
              (place-image (rotate 90 BEAR) 50 50 MTS))
;;
(define (render-bear-on bear img)
  (place-image (rotate (bear-angle bear) BEAR) (position-x (bear-pos bear)) (position-y (bear-pos bear)) img))
;;
;; ========
;;
;; \*===================================================*/


;; /*===================================================*\
;;
;; ListOfBear Integer Integer MouseEvent -> ListOfBear
;; create a new bear at the position of the mouse click
(check-expect (create-bear empty 0 0 "button-down")
              (cons (make-bear (make-position 0 0) 0) empty))
(check-expect (create-bear (cons (make-bear (make-position 50 50) 0) empty) 300 150 "button-down")
              (cons (make-bear (make-position 50 50) 0) (cons (make-bear (make-position 300 150) 0) empty)))

;(define (create-bear lob x y me) empty)      ; Stub
; <Using template from ListOfBear>
(define (create-bear lob x y me)
  (if (mouse=? me "button-down")
      (cond [(empty? lob)
             (cons (make-bear (make-position x y) 0) empty)]
            [else
             (cons (first lob)
                   (create-bear (rest lob) x y me))])
      lob))
;;
;; \*===================================================*/

