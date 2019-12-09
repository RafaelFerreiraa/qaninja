require "base64"

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

After do |scenario|
    if scenario.failed?
        shot_file = page.save_screenshot("log/screenshot.png")
        shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
        embed(shot_b64, "image/png", "Screenshot")
    end
end