;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-starter--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; double-starter.rkt

; 
; PROBLEM:
; 
; Design a function that consumes a number and produces twice that number. 
; Call your function double. Follow the HtDF recipe and leave behind commented 
; out versions of the stub and template.
; 



;; SOLUTION
;; ====================================================================

;; Number -> Number                            ;; SIGNATURE
;; produce two times the given number          ;; PURPOSE
;(define (double n) 0)                         ;; STUB
(check-expect (double 10) 20)                  ;; EXAMPLE (1 of 2)
(check-expect (double .01) (* 2 .01))          ;; EXAMPLE (2 of 2)
;(define (double n)                            ;; TEMPLATE
;  (...n))                                     ;; TEMPLATE (continued)
(define (double n)
  (* 2 n))

;; ====================================================================


;; #1a
;;
;; SIGNATURE
;; Signature tells the author what type of data the function consumes and what type of data it produces.
;;
;; Signature example:
;; Type -> Type
;; Type names must be capitalized. I.E.: 'Number', not 'number'
;;
;; Signature for this problem:
;;
;;
;; ====================================================================
;; Number -> Number ;Commented out initially.
;; ====================================================================

;; #1b
;;
;; PURPOSE
;; Purpose is a ONE-line description of what the function produces in terms of what it consumes.
;;
;; The purpose should be more detailed than the signature.
;;
;; Purpose for this problem:
;;
;;
;; ====================================================================
;; produce two times the given number ;Commented out initially.
;; ====================================================================

;; #1c
;;
;; STUB
;; Stub is a function definition that:
;;     -has correct function name
;;     -has correct number of parameters
;;     -produces dummy result of correct type
;;
;; Stub for this problem:
;;
;;
;; ====================================================================
;;   (define (double n) 0) ;Should not be commented out until finished.
;; ====================================================================

;; #2
;;
;; EXAMPLES (TESTS)
;; Examples help us understand what the function must do. Use multiple examples to illustrate the behaviour.
;; Wrapping the examples in 'check-expect' means they will also serve as unit tests for the completed function.
;; 
;; It is often easier to design a general function if we start with some examples of what it's going to do.
;;
;; Examples for this problem:
;;
;;
;; ====================================================================
;; (check-expect (double 10) 100)    ;Should not be commented out.
;; (check-expect (double .01) .0001) ;Should not be commented out.
;; ====================================================================

;; #3
;;
;; TEMPLATE (INVENTORY)
;; The body of the template is the outline of the function.
;;
;; '...x' means the body is going to do something with the parameter x.
;;
;; Template for this problem:
;;
;;
;; ====================================================================
;; (define (double n)
;;   (...n))
;; ====================================================================

;; #4
;;
;; FUNCTION BODY
;; The final resulting function being created.
;;
;; Use everything written before to know how to complete the function body.
;; Sometimes helps to dissect the function examples (the tests) to see how the expected value could have been produced.
;;
;; Function body for this problem:
;;
;;
;; ====================================================================
;; (define (double n)
;;   (* 2 n))
;; ====================================================================

;; #5
;;
;; RUN TESTS
;; Finally, run tests and make sure everything works
