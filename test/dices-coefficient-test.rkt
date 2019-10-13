#lang racket

(require rackunit)
(require rackunit/text-ui)

(require "../src/dices-coefficient.rkt")

(define find-bigrams-test 
  (test-suite
    "find-bigrams-test"
    (test-case "COMPLEMENT"
      (check-equal? (find-bigrams "COMPLEMENT" 0 (list)) '("CO" "OM" "MP" "PL" "LE" "EM" "ME" "EN" "NT"))
    )

    (test-case "COMPLIMENT" 
      (check-equal? (find-bigrams "COMPLIMENT" 0 (list)) '("CO" "OM" "MP" "PL" "LI" "IM" "ME" "EN" "NT"))
    )
    
    (test-case "BIZARRE"
      (check-equal? (find-bigrams "BIZARRE" 0 (list)) '("BI" "IZ" "ZA" "AR" "RR" "RE"))
    )
    
    (test-case "ALGORITHMS ARE FUN"
      (check-equal? (find-bigrams "ALGORITHMS ARE FUN" 0 (list)) '("AL" "LG" "GO" "OR" "RI" "IT" "TH" "HM" "MS" "S " " A" "AR" "RE" "E " " F" "FU" "UN"))
    )

    (test-case "LOGARITHMS ARE NOT"
      (check-equal? (find-bigrams "LOGARITHMS ARE NOT" 0 (list)) '("LO" "OG" "GA" "AR" "RI" "IT" "TH" "HM" "MS" "S " " A" "AR" "RE" "E " " N" "NO" "OT"))
    ) 
  )
)

(define count-equals-test
  (test-suite
    "count-equals-test"
    (test-case "COMPLEMENT-COMPLIMENT"
      (define bigrams1 (find-bigrams "COMPLEMENT" 0 (list)))
      (define bigrams2 (find-bigrams "COMPLIMENT" 0 (list)))

      (check-equal? (count-equals bigrams1 bigrams2) 7)
    )

    (test-case "BAZAAR-BIZARRE"
      (define bigrams1 (find-bigrams "BAZAAR" 0 (list)))
      (define bigrams2 (find-bigrams "BIZARRE" 0 (list)))

      (check-equal? (count-equals bigrams1 bigrams2) 2)
    )

    (test-case "ALGORITHMS ARE FUN-LOGARITHMS ARE NOT"
      (define bigrams1 (find-bigrams "ALGORITHMS ARE FUN" 0 (list)))
      (define bigrams2 (find-bigrams "LOGARITHMS ARE NOT" 0 (list)))

      (check-equal? (count-equals bigrams1 bigrams2) 10)
    )

    (test-case "ASSISTANCE-ASSISTANCE"
      (define bigrams1 (find-bigrams "ASSISTANCE" 0 (list)))
      (define bigrams2 (find-bigrams "ASSISTANCE" 0 (list)))

      (check-equal? (count-equals bigrams1 bigrams2) 9)
    )
  )
)

(define dices-coefficient-test
  (test-suite "dices-coefficient-test"
    (test-case "COMPLEMENT-COMPLIMENT"
      (check-equal? (dices-coefficient "COMPLEMENT" "COMPLIMENT") 0.7777777777777778)
    )

    (test-case "BAZAAR-BIZARRE"
      (check-equal? (dices-coefficient "BAZAAR" "BIZARRE") 0.36363636363636365)
    )

    (test-case "ALGORITHMS ARE FUN-LOGARITHMS ARE NOT"
      (check-equal? (dices-coefficient "ALGORITHMS ARE FUN" "LOGARITHMS ARE NOT") 0.5882352941176471)
    )

    (test-case "ASSISTANCE-ASSISTANTS"
      (check-equal? (dices-coefficient "ASSISTANCE" "ASSISTANTS") 0.7777777777777778)
    )
    
    (test-case "ASSISTANCE-ASSISTANCE"
      (check-equal? (dices-coefficient "ASSISTANCE" "ASSISTANCE") 1.0)
    )
    
    (test-case "COMPLIMENT-BIZARRE"
      (check-equal? (dices-coefficient "COMPLIMENT" "BIZARRE") 0.0)
    )
  )
)

(run-tests find-bigrams-test)
(run-tests count-equals-test)
(run-tests dices-coefficient-test)
