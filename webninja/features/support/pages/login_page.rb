class LoginPage
    include Capybara::DSL

    def go
        visit '/'
    end

    def logar(email, senha)
        # find('#emailId')
        find('input[name=email]').set email

        # find('#passId')
        find('input[name=password').set senha

        click_button 'Entrar'
    end

    def alert
        find('.alert span').text
    end
end