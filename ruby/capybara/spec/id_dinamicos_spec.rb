describe 'IDs Dinâmicos', :id_dinamico do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/access'
    end

    # $ => termina com
    # ^ => começa com
    # * => contem

    it 'Cadastro' do
        find('input[id$=UsernameInput]').set 'Rafael'
        find('input[id^=PasswordInput]').set '123123'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        sleep 3
    end

end
