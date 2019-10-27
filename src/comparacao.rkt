#lang racket

(require math/statistics)

(define dice-results '(1.00 0.59 0.94 0.59))
(define lcs-results '(1.00 0.34 0.43 0.78))
(define gold-standard '(1.00 0.00 0.37 0.50))

(displayln "Cálculo da correlação")

(display "  Dice's coefficient      : ")
(correlation dice-results gold-standard)
(display "  Longest Common Substring: ")
(correlation lcs-results gold-standard)