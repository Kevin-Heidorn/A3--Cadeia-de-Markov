# Trabalho A3 – Estruturas Matemáticas  
## Equipe: Futebol Markov  

---

## 1. Integrantes  
- Kevin Christian Teixeira Heidorn / RA-12723127838  
- Zheng Poi King / RA-12723117754  
- Robson Gabriel Alencar Souza / RA-1272313956  
- Pedro Henrique Luz / RA-12722122396  

---

## 2. Descrição do Problema  
Este trabalho tem como objetivo modelar a evolução das probabilidades de um time de futebol ganhar, empatar ou perder partidas consecutivas, considerando que o resultado de cada partida influencia o próximo resultado. Para isso, utilizamos uma cadeia de Markov com três estados: Ganhar (G), Empatar (E) e Perder (P).

---

## 3. Matriz de Transição e sua Interpretação  
A cadeia de Markov usada possui três estados que representam os possíveis resultados de uma partida de futebol:  
- **G:** Ganhar  
- **E:** Empatar  
- **P:** Perder  

A matriz de transição **P** representa as probabilidades de transição entre estados na próxima partida. Cada linha representa o estado atual e cada coluna o próximo estado. A matriz utilizada é:

\[
P = \begin{bmatrix}
0.6 & 0.3 & 0.1 \\
0.4 & 0.4 & 0.2 \\
0.3 & 0.3 & 0.4
\end{bmatrix}
\]

Interpretação das linhas:  
- Se o time ganhou, tem 60% de chance de ganhar novamente, 30% de empatar e 10% de perder.  
- Se o time empatou, as probabilidades são 40% ganhar, 40% empatar e 20% perder.  
- Se o time perdeu, as chances são 30% ganhar, 30% empatar e 40% perder.

---

## 4. Estado Inicial e Evolução da Cadeia

### 4.1 Estado Inicial  
O vetor de estado inicial representa o resultado do jogo imediatamente anterior. O usuário pode escolher entre:  
- Ganhar: `[1, 0, 0]`  
- Empatar: `[0, 1, 0]`  
- Perder: `[0, 0, 1]`  

### 4.2 Evolução da Cadeia  
A cada rodada, o vetor de probabilidades é atualizado multiplicando-se pela matriz de transição \(P\), simulando a evolução dos resultados ao longo do tempo. Abaixo, um exemplo de saída simulando 5 rodadas com estado inicial "Empatar":  

| Rodada | Ganhar | Empatar | Perder |  
|--------|---------|----------|---------|  
| 0      | 0.0     | 1.0      | 0.0     |  
| 1      | 0.4     | 0.4      | 0.2     |  
| 2      | 0.44    | 0.37     | 0.19    |  
| 3      | 0.454   | 0.354    | 0.192   |  
| 4      | 0.46    | 0.346    | 0.194   |  
| 5      | 0.463   | 0.341    | 0.196   |  

Com o tempo, as probabilidades convergem para um **estado estacionário** aproximadamente igual a `[0.476, 0.333, 0.191]`, indicando que, a longo prazo, o time tem cerca de 47.6% de chance de ganhar, 33.3% de empatar e 19.1% de perder.

---

## 5. Código-fonte da Aplicação  
O código desenvolvido em Julia está disponível no GitHub no link abaixo:  
[https://github.com/Kevin-Heidorn/A3--Cadeia-de-Markov](https://github.com/Kevin-Heidorn/A3--Cadeia-de-Markov)  

---

## 6. Instruções de Instalação e Uso  
- Instale a linguagem Julia através do site oficial: https://julialang.org/downloads/  
- Baixe ou clone o repositório com o código-fonte.  
- Salve o arquivo principal como `cadeia_markov.jl`.  
- No terminal, execute o programa com o comando:  
  ```bash
  julia cadeia_markov.jl
