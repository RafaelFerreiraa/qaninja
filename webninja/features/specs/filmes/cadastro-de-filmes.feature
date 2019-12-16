#language:pt

@login
Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Esquema do Cenario: Novo filme
        O gestor de catálogo cadastra um novo filme através do formulário
        e um novo registro é inserido no catálogo Ninjaflix.

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro desse filme
        Então devo ver o novo filme na lista

        Exemplos:
        | codigo     |
        | "ultimato" |
        | "spider"   |
        | "coringa"  |

    @validaFilme
    Esquema do Cenario: Novo filme
        O gestor do catálogo tenta cadastrar um novo filme, mas esquece
        de preencher um dos campos que são obrigatórios, em seguida, o sistema
        exibe uma notificação para o usuário.

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro desse filme
        Então devo ver a notificação <texto>

        Exemplos:
        | codigo      | texto                                          |
        | "semTitulo" | "Oops - Filme sem titulo. Pode isso Arnaldo?"  |
        | "semStatus" | "Oops - O status deve ser informado!"          |
        | "semAno"    | "Oops - Faltou o ano de lançamento também!"    |
        | "semData"   | "Oops - Quase lá, só falta a data de estréia!" |
        
    @duplicado
    Cenario: Duplicado
        O gestor tenta cadastrar um filme, porém o título
        já foi cadastrado anteriormente. O sistema notifica ao usuário
        informando que o título já existe

        Dado que "deadpool2" é um novo filme
        Mas este filme já existe no catálogo
        Quando eu faço o cadastro desse filme
        Então devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."