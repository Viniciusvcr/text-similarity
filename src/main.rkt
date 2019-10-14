#lang racket

(require "dices-coefficient.rkt")
(require "lcs.rkt")

(define str1 "COMPLEMENT")
(define str2 "COMPLIMENT")
(define str3 "BIZARRE")

(dices-coefficient str1 str2)
(longest-common-substring str1 str2)
