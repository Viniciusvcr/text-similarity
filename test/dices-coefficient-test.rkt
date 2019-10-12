#lang racket

(require rackunit)
(require rackunit/text-ui)

(require "../src/dices-coefficient.rkt")

(define find-bigrams-test 
  (test-suite
    "find-bigrams-test"
    (test-case "COMPLEMENT"
      (check-equal? (find-bigrams "COMPLEMENT" 0 (list)) (list "CO" "OM" "MP" "PL" "LE" "EM" "ME" "EN" "NT"))
    )
    (test-case "COMPLIMENT" 
      (check-equal? (find-bigrams "COMPLIMENT" 0 (list)) (list "CO" "OM" "MP" "PL" "LI" "IM" "ME" "EN" "NT"))
    )
    (test-case "BIZARRE"
      (check-equal? (find-bigrams "BIZARRE" 0 (list)) (list "BI" "IZ" "ZA" "AR" "RR" "RE"))
    )
  )
)

(run-tests find-bigrams-test)
