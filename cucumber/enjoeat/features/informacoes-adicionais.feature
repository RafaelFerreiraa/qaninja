#language: pt

Funcionalidade: Informacoes adicionais
    Para que eu possa ver as informações adicionais
    Sendo um usuário que escolheu um restaurante
    Posso ver a categoria, descricao detalhada e horario de funcionamento

    @infos
    Cenario: Detalhes do restaurante

        Dado que acesso a lista de restaurantes
        Quando eu seleciono o restaurante "Burger House"
        Entao eu vejo as seguintes Informacoes:
            | categoria | Hamburgers |
            | descricao | 40 anos se especializando em trash food. |
            | horarios  | Funciona todos os dias, de 10h às 22h |