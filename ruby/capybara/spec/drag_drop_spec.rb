describe 'Drag and Drop', :drop do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end

    it 'Homem Aranha pertence ao time Stark' do

        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha]')

        spiderman.drag_to stark
        sleep 3

        expect(stark).to have_css 'img[alt$=Aranha]'
        expect(cap).not_to have_css 'img[alt$=Aranha]'

        spiderman.drag_to cap
        sleep 3

    end

end