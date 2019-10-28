#lang racket

(require math/statistics)
(define (compare)
    (define dice-results '(1.00 0.59 0.94 0.59))
    (define lcs-results '(1.00 0.34 0.43 0.78))
    (define gold-standard '(1.00 0.00 0.37 0.50))

    (define dice-cor (correlation dice-results gold-standard))
    (define lcs-cor (correlation lcs-results gold-standard))
    
    (displayln "Cálculo da correlação")
    (display "  Dice's coefficient      : ")
    (displayln dice-cor)
    (display "  Longest Common Substring: ")
    (displayln lcs-cor)

    (cond
        [(< lcs-cor dice-cor) (displayln "Dice's Coefficient foi o melhor")]
        [else (displayln "LCS foi o melhor")]
    )
)

(compare)
