describe 'Login com Cadastro', :login3 do

    before(:each) do
        visit '/access'
    end

    it 'Login com sucesso!' do
        # login_form = find('#login')

        # login_form.find('input[name=username]').set 'stark'
        # login_form.find('input[name=password]').set 'jarvis!'

        # click_button 'Entrar'

        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'

            sleep 2
        end

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Cadastro com sucesso' do

        within('#signup') do
            find('input[name=username]').set 'Rafael'
            find('input[name=password]').set '123123!'
            click_link 'Criar Conta'

            sleep 2
        end

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

end