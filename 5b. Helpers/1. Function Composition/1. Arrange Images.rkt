;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1. Arrange Images|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images-starter.rkt (problem statement)

; 
; PROBLEM:
; 
; In this problem imagine you have a bunch of pictures that you would like to 
; store as data and present in different ways. We'll do a simple version of that 
; here, and set the stage for a more elaborate version later.
; 
; (A) Design a data definition to represent an arbitrary number of images.
; 
; (B) Design a function called arrange-images that consumes an arbitrary number
;     of images and lays them out left-to-right in increasing order of size.
;     


;; Data Definitions:


;; ListOfImage is one of:
;;  - empty
;;  - (cons Image ListOfImage)
;; interp. a list of images
(define LOI1 empty)
(define LOI2 (cons (square 5 "solid" "black") empty))
(define LOI3 (cons (square 5 "solid" "black") (cons (square 10 "solid" "red") empty)))
#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))
;;
;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons String ListOfString)
;;  - self-reference: (rest loi) is ListOfImage



;; Function definitions:

;; /************************************************************************************************
;;  * Reduce ListOfImage to a single image that consists of every image in ListOfImage
;;  * side-by-side, left-to-right, in increasing order of image size.
;;  *
;;  * @param  {ListOfImage} loi - the list of images to be reduced
;;  * @return {Image} the reduced image
;;  ***********************************************************************************************/
;;
(check-expect (loi->image (cons (square 100 "solid" "black")
                                (cons (square 25 "solid" "red") empty)))
              (beside (square 25 "solid" "red")
                      (square 100 "solid" "black")))
;;
;(define (loi->image loi) (square 0 "solid" "white"))  ;Stub
(define (loi->image loi)
  (layout-images (sort-images loi)))


;; /************************************************************************************************
;;  * Sort images by size (area).
;;  * I am a helper for: loi->image
;;  *
;;  * @param  {ListOfImage} loi - the list of images to be sorted
;;  * @return {ListOfImage} the sorted images
;;  ***********************************************************************************************/
;;
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons (square 50 "solid" "black")
                                 (cons (square 10 "solid" "red") empty)))
              (cons (square 10 "solid" "red")
                    (cons (square 50 "solid" "black") empty)))
(check-expect (sort-images (cons (square 10 "solid" "black")
                                 (cons (square 50 "solid" "red") empty)))
              (cons (square 10 "solid" "black")
                    (cons (square 50 "solid" "red") empty)))

; (define (sort-images loi) loi)  ; Stub
(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)
                 (sort-images (rest loi)))]))  ; Result of natural recursion will be sorted.


;; /************************************************************************************************
;;  * Insert an Image into a ListOfImage based on the size of the Image, ascending.
;;  * I am a helper for: sort-images
;;  * ASSUME: loi is already sorted
;;  *
;;  * @param  {Image}       img - the image to insert in a list
;;  * @param  {ListOfImage} loi - the list of image to insert within
;;  * @return {ListOfImage} the sorted images
;;  *
;;  * !!!
;;  ***********************************************************************************************/
;;
(check-expect (insert (square 5 "solid" "blue")
                      (cons (square 4 "solid" "red") (cons (square 6 "solid" "yellow") empty)))
              (cons (square 4 "solid" "red") (cons (square 5 "solid" "blue") (cons (square 6 "solid" "yellow") empty))))

;(define (insert img loi) loi)  ; Stub
(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if  (first loi)
              (insert (rest loi)))]))

;; /************************************************************************************************
;;  * Layout images side-by-side.
;;  * I am a helper for: loi->image
;;  *
;;  * @param  {ListOfImage} loi - the list of Images to be  laid-out
;;  * @return {Image}             the laid-out Image containing all images in the given ListOfImage
;;  ***********************************************************************************************/
;;
(check-expect (layout-images empty) (square 0 "solid" "white"))
(check-expect (layout-images (cons (square 50 "solid" "black")
                                   (cons (square 10 "solid" "red") empty)))
              (beside (square 10 "solid" "red")
                      (square 50 "solid" "black")))

;(define (layout-images loi) (square 0 "solid" "white"))  ; Stub
(define (layout-images loi)
  (cond [(empty? loi) (square 0 "solid" "white")]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))