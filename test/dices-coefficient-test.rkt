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
    (test-case "Lorem ipsum dolor sit amet"
      (check-equal? (find-bigrams "Lorem ipsum dolor sit amet" 0 (list)) '("Lo" "or" "re" "em" "ip" "ps" "su" "um" "do" "ol" "lo" "or" "si" "it" "am" "me" "et"))
    )
  )
)

(run-tests find-bigrams-test)
