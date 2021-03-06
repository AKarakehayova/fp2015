#lang racket
(require "binary.rkt")

(define (next-hack n)
  (define (helper num)
  (if (and (odd? (number-of-ones (to-binary-string num))) (is-palindrome? (to-binary-string num))) num
      (helper (+ num 1)))
  )
  (helper (+ n 1)))

(define (number-of-ones n)
  (define length (- (string-length (~a n)) 1))
  (define (helper n number i)
    (cond [(> i length) number]
          [(string=?  (~a (string-ref (~a n) (- length i))) "1") (helper n (+ number 1) (+ i 1))]
          [else (helper n number (+ i 1))])
   )
  (helper n 0 0))

(provide is-palindrome?)
(define (is-palindrome? str)
  (string=? str (string-reverse str)))
