class SideBarView
    include Capybara::DSL

    def usuarioLogado
        find('.sidebar-wrapper .user .info span').text
    end
end