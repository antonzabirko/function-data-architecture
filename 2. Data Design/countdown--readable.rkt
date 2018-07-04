;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; countdown-starter.rkt

; 
; PROBLEM:
; 
; Consider designing the system for controlling a New Year's Eve
; display. Design a data definition to represent the current state 
; of the countdown, which falls into one of three categories: 
; 
;  - not yet started
;  - from 10 to 1 seconds before midnight
;  - complete (Happy New Year!)
; 


;; CountDown is one of:
;;  - false
;;  - Natural[1, 10]
;;  - "Happy New Year!"
;; interp.
;;   false means the countdown has not started yet
;;   Natural[1, 10] means countdown is running
;;   "Happy New Year!" means countdown is finished
(define C1 false)
(define C2 5)
(define C3 "Happy New Year!")
#;
(define (fn-for-countdown cd)
  (cond [(false? cd) (...)]
        [(number? cd) (... cd)]
        [else (...)]
  )
)
  
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural[1, 10]
;;  - atomic distinct: "Happy New Year!"