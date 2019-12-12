class MoviePage
    include Capybara::DSL

    def add
        find('.nc-simple-add').click
    end

    def upload(arquivo)
        capa = File.join(Dir.pwd, "features/support/fixtures/capas/" + arquivo)
        capa = capa.tr("/", "\\") if OS.windows?

        Capybara.ignore_hidden_elements = false
        attach_file('upcover', capa)
        Capybara.ignore_hidden_elements = true
    end

    def addAtores(atores)
        ator = find('.input-new-tag')

        atores.each do |a|
            ator.set a
            ator.send_keys :tab
        end
    end

    def create(movie)
        find('input[name=title]').set movie["titulo"]

        find('input[placeholder=Status]').click
        find('.el-select-dropdown__item', text: movie["status"]).click

        find('input[name=year]').set movie["ano"]
        find('input[name=release_date]').set movie["lancamento"]
        
        addAtores(movie["atores"])
        
        find('textarea[name=overview]').set movie["sinopse"]
        upload(movie["capa"])

        find('#create-movie').click
    end

    def linhaFilme(movie)
        find('.table-movies table tbody', text: movie["titulo"])
    end
end