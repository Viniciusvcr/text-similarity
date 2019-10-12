#lang racket

(define (find-bigrams str index lst)
  (cond 
    [(> (+ index 2) (string-length str)) lst]
    [else (find-bigrams str (add1 index) (append lst (list (substring str index (+ index 2)))))]
  )
)

(define (dices-coefficient str1 str2)
  (define str1-bigrams (find-bigrams str1 0 (list)))
  (define str2-bigrams (find-bigrams str2 0 (list)))

  (list str1-bigrams str2-bigrams)
)

(provide dices-coefficient find-bigrams)