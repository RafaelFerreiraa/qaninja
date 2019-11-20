describe 'Dynamic Control', :dc do

    before(:each) do
        visit '/dynamic_controls'
    end

    it 'Quando habilita o campo' do
        res = page.has_field? 'movie', disabled: true
        puts res

        click_button 'Habilita'

        res = page.has_field? 'movie', disabled: false
        puts res
    end

end