class MoviePage
    include Capybara::DSL

    def initialize
        @listaFilmes = "table tbody tr"
    end

    def add
        find('.nc-simple-add').click
    end

    def form
        MovieAdd.new
    end

    def sweet_alert
        SweetAlert.new
    end

    def linhaFilme(titulo)
        find(@listaFilmes, text: titulo)
    end

    def removeFilme(titulo)
        linhaFilme(titulo).find('.btn-trash').click
    end
    
    def filmeExcluido(titulo)
        page.has_no_css?(@listaFilmes, text: titulo)
    end

    def temFilme(titulo)
        page.has_css?(@listaFilmes, text: titulo)
    end
end