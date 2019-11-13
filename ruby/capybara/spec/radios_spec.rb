describe 'Botões de Radio', :radio do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/radios'
    end

    it 'seleção por ID' do
        choose('cap')
    end

    it 'seleção por FIND e CSS selector' do
        find('input[value=black-panther]').click
    end

    after(:each) do
        sleep 3
    end

end