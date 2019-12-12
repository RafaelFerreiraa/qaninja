Before do
    page.current_window.resize_to(1366, 768)

    @loginPage = LoginPage.new
    @sideBar = SideBarView.new
    @moviePage = MoviePage.new
end

Before('@login') do
    @loginPage.go
    @loginPage.logar('sf.rafael20@gmail.com', 'teste652')
end