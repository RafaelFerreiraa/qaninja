describe 'Caixa de seleção', :dropdown do

    it 'Item específico simples' do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'

        select('Loki', from: 'dropdown')
        sleep 3
    end

    it 'Item específico com o find' do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'

        drop = find('.avenger-list')
        drop.find('option', text: 'Bruce Banner').select_option

        # drop = find('.avenger-list').find('option', text: 'Bruce Banner').select_option
        sleep 3
    end

    it 'Qualquer item', :sample do
        visit 'http://training-wheels-protocol.herokuapp.com/dropdown'

        drop = find('.avenger-list')
        drop.all('option').sample.select_option

        sleep 3
    end

end