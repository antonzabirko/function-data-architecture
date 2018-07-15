;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname alternative-tuition-graph--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;; alternative-tuition-graph-starter.rkt

; 
; Consider the following alternative type comment for Eva's school tuition 
; information program. Note that this is just a single type, with no reference, 
; but it captures all the same information as the two types solution in the 
; videos.
; 
; (define-struct school (name tuition next))
; ;; School is one of:
; ;;  - false
; ;;  - (make-school String Natural School)
; ;; interp. an arbitrary number of schools, where for each school we have its
; ;;         name and its tuition in USD
; 
; (A) Confirm for yourself that this is a well-formed self-referential data 
;     definition.
; 
; (B) Complete the data definition making sure to define all the same examples as 
;     for ListOfSchool in the videos.
; 
; (C) Design the chart function that consumes School. Save yourself time by 
;     simply copying the tests over from the original version of chart.
; 
; (D) Compare the two versions of chart. Which do you prefer? Why?
; 


;; =================
;; Constants:

(define Y_SCALE (/ 1 400))
(define BAR_WIDTH 25)
(define FONT_COLOR "black")
(define FONT_SIZE 22)
(define BAR_COLOR "lightblue")


;; (A) It is a well-formed self-referential data definition because it has both a base case and a recursion case.

;; (B)
(define-struct school (name tuition next))
;; School is one of:
;;  - false
;;  - (make-school String Natural School)
;; interp. an arbitrary number of schools, where for each school we have its
;;         name and its tuition in USD
(define S1 false)
(define S2 (make-school "Harvard" 75000 (make-school "M.I.T." 100000 false)))
(define S3 (make-school "Brooklyn College" 25000 (make-school "Harvard" 75000 (make-school "M.I.T." 100000 false))))
#;
(define (fn-for-school sc)
  (cond [(false? sc) (...)]
        [else
         (... (school-name sc)         ; String
              (school-tuition sc)      ; Natural
              (fn-for-school (school-next sc)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic-distinct: false
;;  - atomic non-distinct: (school-name sc) is String
;;  - atomic non-distinct: (school-tuition sc) is Integer
;;  - compound: (make-school String Natural School)
;;  - self-reference: (school-next sc) is School

;; (C)
;; School -> Image
;; produces a bar graph that shows the school name and cost
(check-expect (chart false) (square 0 "solid" "white"))
(check-expect (chart (make-school "Harvard" 75000 (make-school "M.I.T." 100000 false)))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Harvard" FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "solid" BAR_COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "M.I.T." FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "solid" BAR_COLOR))
                            (square 0 "solid" "white")))
(check-expect (chart (make-school "Brooklyn College" 25000 (make-school "Harvard" 75000 (make-school "M.I.T." 100000 false))))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Brooklyn College" FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 25000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 25000 Y_SCALE) "solid" BAR_COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Harvard" FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 75000 Y_SCALE) "solid" BAR_COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "M.I.T." FONT_SIZE FONT_COLOR))
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "outline" "black")
                                           (rectangle BAR_WIDTH (* 100000 Y_SCALE) "solid" BAR_COLOR))
                            (square 0 "solid" "white")))

; (define (chart sc) (square 0 "solid" "white"))   ; Stub
; <Using template from School>
(define (chart sc)
  (cond [(false? sc) (square 0 "solid" "white")]
        [else
         (beside/align "bottom"
                       (overlay/align "center" "bottom"
                                      (rotate 90 (text (school-name sc) FONT_SIZE FONT_COLOR))        ; String
                                      (rectangle BAR_WIDTH (* (school-tuition sc) Y_SCALE) "outline" "black")      ; Natural
                                      (rectangle BAR_WIDTH (* (school-tuition sc) Y_SCALE) "solid" BAR_COLOR))
                       (chart (school-next sc)))]))

;; (D) The first one is highly preferred. In the second example the data is not well-designed. "next" should be taken out of the context of the School type and into a new data
;;     type, like List, the type we worked with in the first bar graph. Due to this semi-faulty design of data, our generic data function did not have a helper function in the
;;     template. Once we started operating a function that consumes that data type and copied the template, we did not seperate the generation of each bar into a helper funct-
;;     -ion. This created a more convulted chart function and data that is more complex than it has to be. More importantly, it is bad practice and can corrupt the design of
;;     software since corrupt data flows downwards and determines the structure of the program.