describe 'Botões de Radio', :upload do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end

    it 'Upload com arquivo de texto' do
        attach_file('file-upload', @arquivo)
        click_button'file-submit'

        divArquivo = find('#uploaded-file')
        expect(divArquivo.text).to eql 'arquivo.txt'
    end

    it 'Upload com arquivo de imagem' do
        attach_file('file-upload', @imagem)
        click_button'file-submit'
        
        divArquivo = find('#uploaded-file')
        expect(divArquivo.text).to eql 'imagem.png'

        img = find('#new-image')
        expect(img[:src]).to include '/uploads/imagem.png'

    end

    after(:each) do
        sleep 3
    end

end