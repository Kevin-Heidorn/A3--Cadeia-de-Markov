Isso significa que começamos no estado 2 com 100% de probabilidade.

---

### Evolução da Cadeia de Markov  
A evolução da cadeia de Markov é o processo pelo qual a distribuição de probabilidades sobre os estados muda ao longo do tempo, rodada após rodada.  

- Começa-se com um vetor de estado inicial, que indica a probabilidade de estar em cada estado no passo zero.  
- A cada rodada, esse vetor é multiplicado pela matriz de transição \(P\) para obter o vetor de probabilidades atualizado.  
- O vetor resultante representa a distribuição de probabilidade dos estados no próximo passo.

Matematicamente, para o vetor de estado \(V_k\) após \(k\) passos:  
\[
V_k = V_{k-1} \times P
\]  
Ou, usando o vetor inicial \(V_0\):  
\[
V_k = V_0 \times P^k
\]  

Onde:  
- \(V_k\) é o vetor de probabilidades após \(k\) rodadas.  
- \(P^k\) é a matriz de transição elevada à potência \(k\), representando as probabilidades de transição após \(k\) passos.

Com isso, é possível acompanhar como a cadeia de Markov se comporta ao longo do tempo, observando as mudanças nas probabilidades de estar em cada estado.

---

## 5. Código-fonte da aplicação  
Link do GitHub: [Kevin-Heidorn/A3--Cadeia-de-Markov](https://github.com/Kevin-Heidorn/A3--Cadeia-de-Markov)  

---

## 6. Instruções de instalação da aplicação  
- Instale Julia (link oficial: [https://julialang.org/downloads/](https://julialang.org/downloads/))  
- Salve o código em um arquivo chamado `cadeia_markov.jl`.  
- Execute no terminal com o comando:  
  ```bash
  julia cadeia_markov.jl
