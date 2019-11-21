describe 'iframes' do

    describe 'Iframe bom', :nice_iframe do

        before(:each) do
            visit '/nice_iframe'
        end

        it 'Adicionar ao carrinho' do

            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 3
            end
        end
    end

    describe 'Iframe ruim', :bad_iframe do

        before(:each) do
            visit '/bad_iframe'
        end

        it 'Carrinho deve estar vazio' do

            # script = '$(".box-iframe").attr("id", "tempId");'
            # page.execute_script(script)
            # frame = find('.box-iframe')

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                sleep 3
            end
        end
    end


end