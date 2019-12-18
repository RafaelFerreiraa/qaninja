class SweetAlert
    include Capybara::DSL

    def confirma
        find('.swal2-confirm').click
    end

    def cancela
        find('.swal2-cancel')
    end
end