#lang racket

(define (find-bigrams str index lst)
  (cond 
    [(equal? (string-ref str index) #\space) (find-bigrams str (add1 index) lst)]
    [(> (+ index 2) (string-length str)) lst]
    [(equal? (string-ref str (add1 index)) #\space) (find-bigrams str (+ index 2) lst)]
    [else (find-bigrams str (add1 index) (append lst (list (substring str index (+ index 2)))))]
  )
)

(define (dices-coefficient str1 str2)
  (define str1-bigrams (find-bigrams str1 0 (list)))
  (define str2-bigrams (find-bigrams str2 0 (list)))

  (list str1-bigrams str2-bigrams)
)

(provide dices-coefficient find-bigrams)