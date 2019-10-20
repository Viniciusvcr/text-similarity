#lang racket

(require "dices-coefficient.rkt")
(require "lcs.rkt")

(display "Insira o primeiro texto: ")
(define str1 (read-line (current-input-port) 'any))
(display "Insira o segundo texto: ")
(define str2 (read-line (current-input-port) 'any))

(displayln "")

(display "Resultado Dice's Coefficient      : ")
(dices-coefficient str1 str2)
(display "Resultado Longest Common Substring: ")
(longest-common-substring str1 str2)
