class OrderPage
    include Capybara::DSL

    def freteTotal
        div = find("div[class*=col-sm-6]", text: "Frete e Total:")
        div.all("table tbody tr")
    end

    def dadosUsuario(usuario)
        find('input[formcontrolname=name]').set usuario[:nome]
        find('input[formcontrolname=email]').set usuario[:email]
        find('input[formcontrolname=emailConfirmation]').set usuario[:email]
        find('input[formcontrolname=address]').set usuario[:rua]
        find('input[formcontrolname=number]').set usuario[:numero]
        find('input[formcontrolname=optionalAddress]').set usuario[:complemento]
    end

    def selecionaPagamento(formaPagamento)
        opcoes = find('mt-radio[formcontrolname=paymentOption]')
        opcoes.find('div', text: formaPagamento).find('div').click
    end

    def finalizarPedido(formaPagamento)
        self.selecionaPagamento(formaPagamento)
        click_button 'Finalizar Pedido'
    end

    def msgConclusao
        find('.content')
    end

end