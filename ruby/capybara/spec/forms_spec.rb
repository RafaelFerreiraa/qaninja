describe 'Forms' do

    it 'login com sucesso' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with:'stark'
        fill_in 'passId', with:'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'senha incorreta' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with:'stark'
        fill_in 'passId', with:'111!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        expect(find('#flash').text).to include 'Senha é invalida!'
        
        expect(find('#flash')).to have_content 'Senha é invalida!'
    
    end

    it 'usuário não cadastrado' do
        visit 'http://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with:'AAA'
        fill_in 'passId', with:'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        expect(find('#flash').text).to include 'O usuário informado não está cadastrado!'
        
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end

end