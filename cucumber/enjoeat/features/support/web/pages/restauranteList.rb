class RestauranteListPage
    include Capybara::DSL

    def load
        visit '/restaurants'
    end

    def lista
        all('.restaurant-item')
    end

    def go(restaurante)
        find(".restaurant-item", text: restaurante.upcase).click
    end


end