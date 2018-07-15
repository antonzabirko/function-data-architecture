;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tuition-graph--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; tuition-graph-starter.rkt  (just the problem statements)

; 
; PROBLEM:
; 
; Eva is trying to decide where to go to university. One important factor for her is 
; tuition costs. Eva is a visual thinker, and has taken Systematic Program Design, 
; so she decides to design a program that will help her visualize the costs at 
; different schools. She decides to start simply, knowing she can revise her design
; later.
; 
; The information she has so far is the names of some schools as well as their 
; international student tuition costs. She would like to be able to represent that
; information in bar charts like this one:
; 
; 
;         .
;         
; (A) Design data definitions to represent the information Eva has.
; (B) Design a function that consumes information about schools and their
;     tuition and produces a bar chart.
; (C) Design a function that consumes information about schools and produces
;     the school with the lowest international student tuition.
; 


;; =================
;; Constants:

(define Y_SCALE (/ 1 400))
(define BAR_WIDTH 25)
(define FONT_COLOR "black")
(define FONT_SIZE 22)
(define BAR_COLOR "lightblue")

;; =================
;; Data definitions:

(define-struct school (name cost))
;; School is (make-school String Natural)
;; interp. name: the name of the school
;;         cost: the cost of the school in USD
(define S1 (make-school "M.I.T." 100000))
(define S2 (make-school "Harvard" 75000))
(define S3 (make-school "Brooklyn College" 25000))
#;
(define (fn-for-school sc)
  (... (school-name sc)
       (school-cost sc)))

;; Template rules used:
;;  - compound: (make-school String Natural)


;; ListOfSchool is one of:
;;  - empty
;;  - (cons School ListOfSchool)
;; interp. a list of Schools
(define LOS1 empty)
(define LOS2 (cons (make-school "M.I.T." 100000) empty))
(define LOS3 (cons (make-school "M.I.T." 100000) (cons (make-school "Harvard" 75000) empty)))
#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (fn-for-school (first los))
              (fn-for-los (rest los)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons School ListOfSchool)
;;  - reference: (first los)
;;  - self-reference: (rest los) is ListOfSchool


;; =================
;; Functions:

;; ListOfSchool -> Image
;; produces a bar graph showing names and tuitions of the consumed schools
(check-expect (chart empty) (square 0 "solid" "white"))
(check-expect (chart (cons (make-school "M.I.T." 100000) empty))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "M.I.T." FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "solid" BAR_COLOR))
                            (square 0 "solid" "white")))
(check-expect (chart (cons (make-school "M.I.T." 100000) (cons (make-school "Harvard" 75000) empty)))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "M.I.T." FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "solid" BAR_COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Harvard" FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "solid" BAR_COLOR))
                            (square 0 "solid" "white")))

; (define (chart los) (square 0 "solid" "white"))   ; Stub
; <Using Template from ListOfSchool>

(define (chart los)
  (cond [(empty? los) (square 0 "solid" "white")]
        [else
         (beside/align "bottom"
                       (make-bar (first los))
                       (chart (rest los)))]))

;; School -> Image
;; produces a bar for a single school in the bar chart
(check-expect (make-bar (make-school "M.I.T." 100000))
              (overlay/align "center" "bottom"
                             (rotate 90 (text "M.I.T." FONT_SIZE FONT_COLOR))
                             (rectangle BAR_WIDTH (* 100000 Y_SCALE) "outline" "black")
                             (rectangle BAR_WIDTH (* 100000 Y_SCALE) "solid" BAR_COLOR)))

; (define (make-bar s) (square 0 "solid" "white"))     ; Stub
; <Using template from School>
(define (make-bar sc)
  (overlay/align "center" "bottom"
                 (rotate 90 (text (school-name sc) FONT_SIZE FONT_COLOR))
                 (rectangle BAR_WIDTH (* (school-cost sc) Y_SCALE) "outline" "black")
                 (rectangle BAR_WIDTH (* (school-cost sc) Y_SCALE) "solid" BAR_COLOR)))