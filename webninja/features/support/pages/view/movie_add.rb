class MovieAdd

    include Capybara::DSL

    def create(movie)
        find('input[name=title]').set movie["titulo"]
        selectStatus(movie["status"]) unless movie["status"].empty?

        find('input[name=year]').set movie["ano"]
        find('input[name=release_date]').set movie["lancamento"]
        
        addAtores(movie["atores"])
        
        find('textarea[name=overview]').set movie["sinopse"]
        upload(movie["capa"]) unless movie["capa"].empty?

        find('#create-movie').click
    end
    
    def alerta
        find('.alert').text
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

    def selectStatus(status)
        find('input[placeholder=Status]').click
        sleep 1
        find('.el-select-dropdown__item', text: status).click
    end

end