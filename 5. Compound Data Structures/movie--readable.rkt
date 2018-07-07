;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname movie--readable) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; movie-starter.rkt

;; =================
;; Data definitions:

(define-struct movie (name budget year))
;; Movie is (make-movie String Natural Natural)
;; interp. (make-movie name budget year) is a movie with
;;       name is the name of the movie
;;       budget is the cost of making the movie
;;       year is when the movie was released
(define M0 (make-movie "Titanic" 200000000 1997))
(define M1 (make-movie "Avatar" 237000000 2009))
(define M2 (make-movie "The Avengers" 220000000 2012))
#;
(define (fn-for-movie m)
  (... (movie-name m)
       (movie-budget m)
       (movie-year m)))

; 
; PROBLEM A:
; 
; Design a data definition to represent a movie, including  
; title, budget, and year released.
; 
; To help you to create some examples, find some interesting movie facts below: 
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
; 
; However, feel free to resarch more on your own!
; 


;; =================
;; Functions:

;; Movie Movie -> String
;; produces the title of the most recently released movie
(check-expect (newest-movie (make-movie "Titanic" 200000000 1997) (make-movie "Avatar" 237000000 2009)) "Avatar") 
(check-expect (newest-movie (make-movie "The Avengers" 220000000 2012) (make-movie "Avatar" 237000000 2009)) "The Avengers") 

; (define (newest-movie mA mB) "The Avengers")         ;Stub
;<use template from Movie>
(define (newest-movie mA mB)
  (if (< (movie-year mA) (movie-year mB))
      (movie-name mB)
      (movie-name mA)))

; 
; PROBLEM B:
; 
; You have a list of movies you want to watch, but you like to watch your 
; rentals in chronological order. Design a function that consumes two movies 
; and produces the title of the most recently released movie.
; 
; Note that the rule for templating a function that consumes two compound data 
; parameters is for the template to include all the selectors for both 
; parameters.
; 

