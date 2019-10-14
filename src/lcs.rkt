#lang racket

(require memoize)

(define/memo (lcs str1 str2 m n)
  (cond
    [(or (equal? m 0) (equal? n 0)) 0]
    [(equal? (string-ref str1 (sub1 m)) (string-ref str2 (sub1 n))) (+ 1 (lcs str1 str2 (sub1 m) (sub1 n)))]
    [else (max (lcs str1 str2 m (sub1 n)) (lcs str1 str2 (sub1 m) n))]
  )
)

(define (longest-common-substring str1 str2)
  (define str1-length (string-length str1))
  (define str2-length (string-length str2))

  (exact->inexact(/ (lcs str1 str2 str1-length str2-length) (max str1-length str2-length)))
)

(provide lcs longest-common-substring)