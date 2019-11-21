class Veiculo
    attr_accessor :nome, :marca, :modelo

    def initialize(nome, marca, modelo)
        self.nome = nome
        self.marca = marca
        self.modelo = modelo
    end

    def ligar
        puts "#{nome} está pronto para andar"
    end

    def buzinar
        'beep, beep'
    end
end

class Carro < Veiculo

    def dirigir
        puts "#{nome} está andando"
    end
end

class Moto < Veiculo

    def pilotar
        puts "#{nome} está andando"
    end
end

uninho = Carro.new('Uno', 'Fiat', 'fire')
puts uninho.ligar
puts uninho.buzinar
puts uninho.dirigir

fazer = Moto.new('Fazer', 'Yamaha', '250x')
puts fazer.ligar
puts fazer.buzinar
puts fazer.pilotar