#language: pt

@bread_bakery
Funcionalidade: Remover do carrinho
    Para que eu possa manter meu carrinho apenas com itens desejados
    Sendo um cliente que desistiu de um ou mais produtos
    Posso remover itens do meu carrinho

    @temp
    Esquema do Cenario: Remover item

        Dado que eu tenho os seguintes itens no carrinho:
            | nome                   | preco    | quantidade |
            | Cup Cake               | R$ 8,70  | 1          |
            | Donut                  | R$ 2,50  | 1          |
            | Pão Artesanal Italiano | R$ 15,90 | 1          |
        Quando eu removo o <item>
        E o valor total deve ser de <total>

        Exemplos:
        | item | total      |
        | 0    | "R$ 18,40" |
        | 1    | "R$ 24,60" |
        | 2    | "R$ 11,20" |

    Cenario: Remover todos os itens

        Dado que eu tenho os seguintes itens no carrinho:
            | nome                   | preco    | quantidade |
            | Cup Cake               | R$ 8,70  | 1          |
            | Donut                  | R$ 2,50  | 1          |
            | Pão Artesanal Italiano | R$ 15,90 | 1          |
            Quando eu removo todos os itens
            Então vejo a seguinte mensagem no carrinho "Seu carrinho está vazio!"