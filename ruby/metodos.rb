def diga_ola(nome)
    puts 'e ae ' + nome
end

diga_ola('rafael')

def soma(v1, v2)
    total = v1 + v2
    total
end

puts 'Informe o numero 1:'
numero1 = gets.chomp.to_i

puts 'Informe o numero 2:'
numero2 = gets.chomp.to_i

res = soma(numero1, numero2)

puts res