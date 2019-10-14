#lang racket

(require rackunit)
(require rackunit/text-ui)

(require "../src/lcs.rkt")

(define lcs-test
  (test-suite
    "lcs-test"
    (test-case "COMPLEMENT-COMPLIMENT"
      (define str1 "COMPLEMENT")
      (define str2 "COMPLIMENT")

      (check-equal? (lcs str1 str2 (string-length str1) (string-length str2)) 9)    
    )

    (test-case "BAZAAR BIZARRE"
      (define str1 "BAZAAR")
      (define str2 "BIZARRE")

      (check-equal? (lcs str1 str2 (string-length str1) (string-length str2)) 4)
    )

    (test-case "ASSISTANCE-ASSISTANCE"
      (define str1 "ASSISTANCE")

      (check-equal? (lcs str1 str1 (string-length str1) (string-length str1)) 10)
    )

    (test-case "ALGORITHMS ARE FUN-LOGARITHMS ARE NOT"
      (define str1 "ALGORITHMS ARE FUN")
      (define str2 "LOGARITHMS ARE NOT")

      (check-equal? (lcs str1 str2 (string-length str1) (string-length str2)) 14)
    )

    (test-case "SOL-LUA"
      (define str1 "SOL")
      (define str2 "ÁGUA")

      (check-equal? (lcs str1 str2 (string-length str1) (string-length str2)) 0)
    )
  )
)

(define longest-common-substring-test
  (test-suite "longest-common-substring-test"
    (test-case "ASSISTANCE-ASSISTANCE"
      (check-equal? (longest-common-substring "ASSISTANCE" "ASSISTANCE") 1.0)
    )

    (test-case "SOL-ÁGUA"
      (check-equal? (longest-common-substring "SOL" "ÁGUA") 0.0)
    )

    (test-case "ALGORITHMS ARE FUN-LOGARITHMS ARE NOT"
      (check-equal? (longest-common-substring "ALGORITHMS ARE FUN" "LOGARITHMS ARE NOT") (exact->inexact 14/18))
    )
  )
)

(run-tests lcs-test)
(run-tests longest-common-substring-test)