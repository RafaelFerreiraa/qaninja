describe 'Caixa de opções', :dropdown do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'
    end

    it 'Item específico simples' do
        select('Loki', from: 'dropdown')
    end

    it 'Item específico com o find' do

        drop = find('.avenger-list')
        drop.find('option', text: 'Bruce Banner').select_option

        # drop = find('.avenger-list').find('option', text: 'Bruce Banner').select_option
    end

    it 'Qualquer item', :sample do

        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end

    after(:each) do
        sleep 3
    end

end