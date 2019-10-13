#lang racket

(define (bigram-equal? bigram1 bigram2 index1 index2 counter)
  (cond
    [(>= index1 (length bigram1)) counter]
    [(>= index2 (length bigram2)) (bigram-equal? bigram1 bigram2 (add1 index1) 0 counter)]
    [(string=? (list-ref bigram1 index1) (list-ref bigram2 index2)) (bigram-equal? bigram1 (remove (list-ref bigram2 index2) bigram2) index1 (add1 index2) (add1 counter))]
    [else (bigram-equal? bigram1 bigram2 index1 (add1 index2) counter)]
  )
)

(define (count-equals bigram1 bigram2)
  (bigram-equal? bigram1 bigram2 0 0 0)
)

(define (find-bigrams str index lst)
  (cond 
    ; [(equal? (string-ref str index) #\space) (find-bigrams str (add1 index) lst)]
    [(> (+ index 2) (string-length str)) lst]
    ; [(equal? (string-ref str (add1 index)) #\space) (find-bigrams str (+ index 2) lst)]
    [else (find-bigrams str (add1 index) (append lst (list (substring str index (+ index 2)))))]
  )
)

(define (dices-coefficient str1 str2)
  (define str1-bigrams (find-bigrams str1 0 (list)))
  (define str2-bigrams (find-bigrams str2 0 (list)))

  (define len-str1-bigrams (length str1-bigrams))
  (define len-str2-bigrams (length str2-bigrams))
  (define coefficient (/ (* 2 2) (+ len-str1-bigrams len-str2-bigrams)))

  (list str1-bigrams str2-bigrams)
)

(provide dices-coefficient find-bigrams count-equals)