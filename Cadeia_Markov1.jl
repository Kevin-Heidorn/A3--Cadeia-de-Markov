function simular_markov(estado_inicial, P, passos)
    estado_atual = estado_inicial
    println("Estado inicial: ", estado_atual)
    for i in 1:passos
        estado_atual = (estado_atual' * P)'
        println("Após ", i, " rodada(s): ", round.(estado_atual; digits=4))
    end
end

# Pergunta o número de estados
print("Digite o número de estados (N): ")
N = parse(Int, readline())

# Define a matriz N×N
println("\nDefina a matriz de transição ", N, "×", N, " (cada linha deve somar 1):")
P = zeros(N, N)
for i in 1:N
    for j in 1:N
        print("Prob. de ir do estado ", i, " para o estado ", j, ": ")
        P[i, j] = parse(Float64, readline())
    end
    if !isapprox(sum(P[i, :]), 1.0, atol=1e-5)
        error("A linha ", i, " deve somar 1.0 (soma atual: ", sum(P[i, :]), ")")
    end
end

# Pergunta o estado inicial
println("\nQual é o estado inicial?")
for i in 1:N
    println("[$i] Estado ", i)
end
print("Digite o número correspondente: ")
escolha = parse(Int, readline())

estado_inicial = zeros(N)
estado_inicial[escolha] = 1.0

# Pergunta o número de rodadas
print("\nDigite o número de rodadas: ")
passos = parse(Int, readline())

# Executa a simulação
simular_markov(estado_inicial, P, passos)

