# text-similarity

Repositório do primeiro trabalho de PPLF - CC UEM 2019

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Objetivo

O objetivo deste trabalho é implementar dois algoritmos de verificação de similaridade de textos usando a linguagem funcional Racket. 

As funções que calculam a similaridade retornam:

- 0, se os textos forem totalmente diferentes;
- 1, se os textos forem totalmente iguais;

### Métodos utilizados

Para a comparação dos textos, foram utilizados dois métodos de comparação: 

1. **Dice's Coefficient**
2. **Longest Common SubString**

A implementação dos métodos foi modularizada e está disponível na pasta "src".

Mais informações sobre os métodos de comparação:
[A Survey of Text Similarity Approaches](https://pdfs.semanticscholar.org/5b5c/a878c534aee3882a038ef9e82f46e102131b.pdf)

## Execução

- Para executar o programa principal, utilize ```racket src/main.rkt```
- O programa suporta redirecionamento de entrada, para isso utilize ```racket src/main.rkt < texto```
    - Os textos usados nos testes estão disponíveis em "docs/textos-testes"
