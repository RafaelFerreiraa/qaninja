class RestaurantePage
    include Capybara::DSL

    def detalhes
        find('#detail')
    end

    def cardapioLista
        all('.menu-item-info-box')
    end

    def adicionaAoCarrinho(produto)
        find(".menu-item-info-box", text: produto.upcase).find(".add-to-cart").click
    end

    def cart
        CarrinhoView.new
    end

end