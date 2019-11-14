describe 'Select2', :select2 do

    describe('single', :single) do

        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'Seleciona ator por nome' do
            find('.select2-selection--single').click
            sleep 1

            find('.select2-results__option', text: 'Jim Carrey').click
            sleep 4
        end

        it 'Busca e clica no Ator' do
            find('.select2-selection--single').click
            sleep 1

            find('.select2-search__field').set 'Chris Rock'
            sleep 2

            find('.select2-results__option').click
            sleep 5
        end

    end


    describe('multiple', :multiple) do

        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def seleciona(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'Seleciona atores' do

            atores = ['Chris Rock', 'Jim Carrey', 'Owen Wilson']

            atores.each do |a|
                seleciona(a)
            end
            
            sleep 4
        end

    end


end