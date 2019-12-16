#language:pt

@login
Funcionalidade: Confirmar exclusão
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título cancelado
    Posso remover este item

    @removeFilme
    Cenario: Excluir filme

        Dado que "dbz" está no catálogo
        Quando eu solicito a exclusão
        E eu confirmo a soliticação
        Então este item deve ser removido do catálogo

    Cenario: Cancelar exclusão

        Dado que "10 coisas que eu odeio em você" faz parte do catálogo
        Quando eu solicito a exclusão
        Mas cancelo a soliticação
        Então este item deve permanecer no catálogo