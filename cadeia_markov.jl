function simular_markov(estado_inicial, P, passos)
    estado_atual = estado_inicial

    println("Estado inicial (G, E, P): ", estado_atual)

    for i in 1:passos
        estado_atual = (estado_atual' * P)'
        println("Após ", i, " rodada(s): ", round.(estado_atual; digits=4))
    end
end

# Matriz de transição
P = [
    0.6 0.3 0.1;  # De Ganhar para (G, E, P)
    0.4 0.4 0.2;  # De Empatar para (G, E, P)
    0.3 0.3 0.4   # De Perder para (G, E, P)
]

# Pergunta para definir o estado inicial
println("Qual é o estado inicial do time?")
println("[1] Ganhar")
println("[2] Empatar")
println("[3] Perder")
print("Digite o número correspondente: ")
escolha = parse(Int, readline())

# Define o estado inicial com base na escolha
estado_inicial = if escolha == 1
    [1.0, 0.0, 0.0]
elseif escolha == 2
    [0.0, 1.0, 0.0]
elseif escolha == 3
    [0.0, 0.0, 1.0]
else
    error("Escolha inválida. Digite 1, 2 ou 3.")
end

# Pergunta o número de rodadas
print("Digite o número de rodadas: ")
passos = parse(Int, readline())

# Executa a simulação
simular_markov(estado_inicial, P, passos)
