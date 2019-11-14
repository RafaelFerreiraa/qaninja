describe 'Mouse Hovers', :hovers do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/hovers'
    end

    it 'Quando passo o mause sobre o Blade' do

        # Começa com Pantera
        # card = find('img[alt^="Pantera"]')

        # Termina com Aranha
        # card = find('img[alt$="Aranha"]')

        # Contém Aranha
        # card = find('img[alt*="Aranha"]')

        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'Quando passo o mause sobre o Pantera Negra' do
        card = find('img[alt="Pantera Negra"]')
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'Quando passo o mause sobre o Homem Aranha' do
        card = find('img[alt="Homem Aranha"]')
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 2
    end

end