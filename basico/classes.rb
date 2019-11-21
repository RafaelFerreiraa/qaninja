class Carro
    attr_accessor :nome
    def ligar
        puts 'carro ligado'
    end
end

civic = Carro.new

civic.nome = 'nome do carro agora'

civic.ligar
puts civic.class
puts civic.nome