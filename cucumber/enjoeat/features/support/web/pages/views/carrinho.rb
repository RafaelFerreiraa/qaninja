class CarrinhoView
    include Capybara::DSL

    def box
        find("#shopping-cart")
    end

    def total
        box.find("tr", text: "Total:").find("td")
    end

    def removeItem(item)
        box.all('table tbody tr')[item].find('.danger').click
    end

    def limpar
        click_button 'Limpar'
    end

    def fecharCarrinho
        click_link "Fechar Pedido"
    end
    
end