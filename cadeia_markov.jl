using Plots

function simular_markov(estado_inicial, P, passos)
    estados = zeros(length(estado_inicial), passos+1)
    estados[:, 1] = estado_inicial

    for i in 1:passos
        estados[:, i+1] = estados[:, i]' * P |> vec
    end

    return estados
end

# Matriz de transição
P = [
    0.6 0.3 0.1;  # De Ganhar para (G, E, P)
    0.4 0.4 0.2;  # De Empatar para (G, E, P)
    0.3 0.3 0.4   # De Perder para (G, E, P)
]

# Estado inicial
estado_inicial = [0.0, 1.0, 0.0]  # Começando em Empatar

# Número de passos
passos = 5

# Simular
resultados = simular_markov(estado_inicial, P, passos)

# Plotar
rodadas = 0:passos
plot(rodadas, resultados[1, :], label="Ganhar", lw=3, marker=:circle)
plot!(rodadas, resultados[2, :], label="Empatar", lw=3, marker=:star)
plot!(rodadas, resultados[3, :], label="Perder", lw=3, marker=:diamond)
xlabel!("Rodadas")
ylabel!("Probabilidade")
title!("Evolução das Probabilidades")
