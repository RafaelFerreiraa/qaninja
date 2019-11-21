describe 'Alertas de JS', :alerts do

    before(:each) do
        visit '/javascript_alerts'
    end

    it 'Alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 2
    end

    it 'Sim confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        sleep 2

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
        sleep 3
    end

    it 'Não confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        sleep 2

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
        sleep 3
    end

    it 'Accept Prompt', :accept do
        accept_prompt(with: 'Rafael') do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content 'Olá, Rafael'
        sleep 2
    end

    it 'Dismiss Prompt', :dismiss do
        dismiss_prompt() do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, null'
        sleep 2
    end

end