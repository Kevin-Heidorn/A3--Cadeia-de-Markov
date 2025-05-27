function simular_markov(estado_inicial, P, passos)
    estado_atual = estado_inicial

    println("Estado inicial (G, E, P): ", estado_atual)

    for i in 1:passos
        estado_atual = (estado_atual' * P)'
        println("Após ", i, " rodada(s): ", round.(estado_atual; digits=4))
    end
end

P = [
    0.6 0.3 0.1;
    0.4 0.4 0.2;
    0.3 0.3 0.4
]

estado_inicial = [0.0, 1.0, 0.0]

passos = 5

simular_markov(estado_inicial, P, passos)
