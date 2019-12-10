Before do
    page.current_window.resize_to(1366, 768)

    @login = LoginPage.new
    @sideBar = SideBarView.new
end