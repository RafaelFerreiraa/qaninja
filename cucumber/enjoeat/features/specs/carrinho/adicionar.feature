#language: pt

@bread_bakery
Funcionalidade: Adicionar ao carrinho
    Para que eu possa finalizar uma compra
    Sendo um cliente que já decidiu o que deseja comer
    Posso adicionar itens ao meu carrinho

    Cenario: Adicionar 1 unidade

        Dado que o produto desejado é "Cup Cake"
        E o valor do produto é de "R$ 8,70"
        Quando eu adiciono 1 unidade
        Então deve ser adicionada 1 unidade deste item
        E o valor total deve ser de "R$ 8,70"
    
    @temp
    Cenario: Adicionar 2 unidade

        Dado que o produto desejado é "Donut"
        E o valor do produto é de "R$2,50"
        Quando eu adiciono 2 unidade
        Então 2 unidades devem ser adicionado ao carrinho
        E o valor total deve ser de "R$ 5,00"

    Cenario: Adicionar varios itens

        Dado que os produtos desejados são:
            | nome                   | preco    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesanal Italiano | R$ 15,00 |
        Quando eu adiciono todos os itens no carrinho
        Então veto todos os itens no carrinho
        E o valor total deve ser de "R$ 27,10"