#language: pt

@bread_bakery
Funcionalidade: Adicionar ao carrinho
    Para que eu possa finalizar uma compra
    Sendo um cliente que já decidiu o que deseja comer
    Posso adicionar itens ao meu carrinho

    Cenario: Adicionar 1 unidade

        Dado que o produto desejado é "Cup Cake"
        E o valor do produto é de "R$ 8,70"
        Quando eu adiciono 1 unidade(s)
        Então deve ser adicionada 1 unidade(s) deste item
        E o valor total deve ser de "R$ 8,70"
    
    Cenario: Adicionar 2 unidade

        Dado que o produto desejado é "Donut"
        E o valor do produto é de "R$2,50"
        Quando eu adiciono 2 unidade(s)
        Então deve ser adicionada 2 unidade(s) deste item
        E o valor total deve ser de "R$ 5,00"

    Cenario: Adicionar varios itens

        Dado que os produtos desejados são:
            | nome                   | preco    | quantidade |
            | Cup Cake               | R$ 8,70  | 2          |
            | Donut                  | R$ 2,50  | 3          |
            | Pão Artesanal Italiano | R$ 15,90 | 4          |
        Quando eu adiciono todos os itens no carrinho
        Então vejo todos os itens no carrinho
        E o valor total deve ser de "R$ 88,50"