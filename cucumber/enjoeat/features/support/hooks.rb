Before do
    page.current_window.resize_to(1366, 768)

    @restauranteListPage = RestauranteListPage.new
    @restaurantePage     = RestaurantePage.new
    @orderPage           = OrderPage.new 
end

Before("@bread_bakery") do
    visit "restaurants/bread-bakery/menu"
end

Before("@green_food") do
    visit "restaurants/green-food/menu"
end