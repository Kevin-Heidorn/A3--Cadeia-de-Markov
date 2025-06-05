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

# Define a matriz N×N, validando entradas entre 0 e 1 e soma da linha ≤ 1
println("\nDefina a matriz de transição ", N, "×", N, " (cada valor entre 0 e 1, soma da linha deve ser 1):")
P = zeros(N, N)
for i in 1:N
    println("Defina as probabilidades da linha ", i, ":")
    soma_parcial = 0.0
    for j in 1:N
        while true
            print("Prob. de ir do estado ", i, " para o estado ", j, ": ")
            valor = try
                parse(Float64, readline())
            catch
                println("Entrada inválida! Digite um número válido.")
                continue
            end

            # Checa se valor está entre 0 e 1
            if valor < 0.0 || valor > 1.0
                println("Valor inválido! A probabilidade deve estar entre 0 e 1. Tente novamente.")
                continue
            end

            # Checa se soma parcial + valor não ultrapassa 1
            if soma_parcial + valor > 1.0 + 1e-10  # margem pequena para erro numérico
                println("Valor inválido! Soma da linha ultrapassaria 1. Tente um valor menor ou igual a ", 1.0 - soma_parcial)
                continue
            end

            # Se chegou aqui, valor válido
            P[i, j] = valor
            soma_parcial += valor
            break
        end
    end

    # Depois de preencher a linha, verifica se soma == 1 (com tolerância)
    if !isapprox(soma_parcial, 1.0, atol=1e-5)
        error("A linha ", i, " deve somar 1.0 (soma atual: ", soma_parcial, ")")
    end
end

# Pergunta o estado inicial
println("\nQual é o estado inicial?")
for i in 1:N
    println("[$i] Estado ", i)
end
print("Digite o número correspondente: ")
escolha = parse(Int, readline())
if escolha < 1 || escolha > N
    error("Escolha inválida!")
end

estado_inicial = zeros(N)
estado_inicial[escolha] = 1.0

# Pergunta o número de rodadas
print("\nDigite o número de rodadas: ")
passos = parse(Int, readline())

# Executa a simulação
simular_markov(estado_inicial, P, passos)