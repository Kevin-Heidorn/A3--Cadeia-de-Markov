# Simulação de Cadeia de Markov em Julia

## Descrição

Este projeto implementa a simulação de Cadeias de Markov utilizando a linguagem Julia. A aplicação simula a evolução das probabilidades de três estados — Ganhar, Empatar e Perder — ao longo de várias rodadas, utilizando uma matriz de transição definida.

O projeto foi desenvolvido como parte do Trabalho A3 da disciplina, baseado no capítulo 1 do livro de Álgebra Linear do autor BOLDRINI.

---

## Estrutura do Projeto

- `cadeia_markov.jl` — Código fonte em Julia que contém a função para simular a cadeia de Markov e gerar o gráfico da evolução das probabilidades.

---

## Como executar

### Requisitos

- [Julia](https://julialang.org/downloads/) instalada em seu sistema.
- O pacote `Plots` para geração de gráficos.

### Instalação do pacote Plots

Abra o REPL do Julia e execute:

```julia
using Pkg
Pkg.add("Plots")
