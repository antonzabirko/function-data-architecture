;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname area-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; area-starter.rkt

; 
; PROBLEM:
; 
; DESIGN a function called area that consumes the length of one side 
; of a square and produces the area of the square.
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 




;; SOLUTION
;; ====================================================================
;; Number -> Number
;; given length of one side a square, produce area of that square
;(define (area n) 0)

(check-expect (area 4) 16)
(check-expect (area .1) .01)

;(define (area n)
;  (... n)
  
(define (area n)
  (* n n))
;; ====================================================================


;; #1a
;;
;; SIGNATURE
;; Signature tells the author what type of data the function consumes and what type of data it produces.
;;
;; Signature example:
;; Type -> Type
;; Type names must be capitalized. I.E.: 'Number', not 'number'

;; #1b
;;
;; PURPOSE
;; Purpose is a ONE-line description of what the function produces in terms of what it consumes.
;;
;; The purpose should be more detailed than the signature.

;; #1c
;;
;; STUB
;; Stub is a function definition that:
;;     -has correct function name
;;     -has correct number of parameters
;;     -produces dummy result of correct type

;; #2
;;
;; EXAMPLES (TESTS)
;; Examples help us understand what the function must do. Use multiple examples to illustrate the behaviour.
;; Wrapping the examples in 'check-expect' means they will also serve as unit tests for the completed function.
;; 
;; It is often easier to design a general function if we start with some examples of what it's going to do.

;; #3
;;
;; TEMPLATE (INVENTORY)
;; The body of the template is the outline of the function.
;;
;; '...x' means the body is going to do something with the parameter x.

;; #4
;;
;; FUNCTION BODY
;; The final resulting function being created.
;;
;; Use everything written before to know how to complete the function body.
;; Sometimes helps to dissect the function examples (the tests) to see how the expected value could have been produced.

;; #5
;;
;; RUN TESTS
;; Finally, run tests and make sure everything works