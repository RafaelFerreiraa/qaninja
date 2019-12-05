class OrderPage
    include Capybara::DSL

    def freteTotal
        div = find("div[class*=col-sm-6]", text: "Frete e Total:")
        div.all("table tbody tr")
    end
end