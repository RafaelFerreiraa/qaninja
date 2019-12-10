#language: pt

Funcionalidade: login
    Para que eu possa gerenciar os filmes do catálago NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com meu email e senha

    @login_happy
    Cenario: Acesso
        Quando eu faço login com "sf.rafael20@gmail.com" e "teste652"
        Então devo ser autenticado
        E devo ver "Rafael Ferreira" na área logada

    @login_fail
    Esquema do Cenario: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <mensagem>

        Exemplos:
            | email                   | senha | mensagem                       |
            | "sf.rafael20@gmail.com" | "123" | "Usuário e/ou senha inválidos" |
            | "teste@gmail.com"       | "123" | "Usuário e/ou senha inválidos" |
            | ""                      | "123" | "Opps. Cadê o email?"          |
            | "teste@gmail.com"       | ""    | "Opps. Cadê a senha?"          |