;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-starter_homeworkasdf) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; double-starter__homework.rkt

; 
; PROBLEM:
; 
; Design a function that pluralizes a given word. (Pluralize means to convert the word to its plural form.)
; For simplicity you may assume that just adding s is enough to pluralize a word.
; 



;; SOLUTION
;; ====================================================================
;; String -> String                                         ;; SIGNATURE
;; produce the given string with an 's' appended            ;; PURPOSE
;(define (plural str) "test")                               ;; STUB

(check-expect (plural "house") "houses")                    ;; EXAMPLES (1 of 2)
(check-expect (plural "yyy") "yyys")                        ;; EXAMPLES (2 of 2)

;(define (plural str)                                       ;; TEMPLATE
;  (... str))                                               ;; TEMPLATE

(define (plural str)                                        ;; FUNCTION BODY
  (string-append str "s"))                                  ;; FUNCTION BODY

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
