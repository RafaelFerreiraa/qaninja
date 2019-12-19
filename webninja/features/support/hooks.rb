Before do
    page.current_window.resize_to(1366, 768)
    # page.driver.browser.manage.window.maximize
    
    @loginPage = LoginPage.new
    @sideBarPage = SideBarView.new
    @moviePage = MoviePage.new
end

Before('@login') do
    usuario = CONFIG["users"]["gestor"]
    @loginPage.go
    @loginPage.logar(usuario["email"], usuario["senha"])
end

After do |scenario|
    # if scenario.failed?
        tempShot = page.save_screenshot("log/tempShot.png")
        screeshot = Base64.encode64(File.open(tempShot).read)
        embed(screeshot, "image/png", "Print_da_tela")
    # end
end