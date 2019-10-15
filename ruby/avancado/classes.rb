class Conta
    attr_accessor :saldo, :nome

    def initialize(nome)
        self.saldo = 0.0
        self.nome = nome

        puts self.nome
    end

    def deposita(valor)
        
        self.saldo += valor

        puts "Deposito de:   #{valor} reais."
        puts "Saldo atual:   #{self.saldo} reais."
    end
end

c = Conta.new('rafael')

c.deposita(100.55)
c.deposita(12.45)
