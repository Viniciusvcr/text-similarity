#lang racket

(require "dices-coefficient.rkt")
(require "lcs.rkt")

(display "Insira a primeira string: ")
(define str1 (read-line (current-input-port) 'any))
(display "Insira a segunda string: ")
(define str2 (read-line (current-input-port) 'any))

(displayln "")

(display "Resultado Dice's Coefficient: ")
(dices-coefficient str1 str2)
(display "Resultado LCS               : ")
(longest-common-substring str1 str2)
