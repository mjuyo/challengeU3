require_relative 'ar.rb'
require 'faker'

# In a loop user Faker to generate 10 new categories. 
10.times do
    category_name = Faker::Coffee.origin
    category = Category.create(name: category_name)
    puts "Category created: #{category.name}"
    
    # Within this same loop use the newly created and saved category objects to generate 10 new products for each category. The name, description, price and quantity of these 10 products should also be generated using faker.
    10.times do
        product_name = Faker::Coffee.blend_name
        product_description = Faker::Coffee.notes
        product_price = Faker::Commerce.price(10.0, 100.0)
        product_quantity = Faker::Number.between(1, 20)

        product = category.products.create(
                                            name: product_name,
                                            description: product_description,
                                            price: product_price,
                                            stock_quantity: product_quantity
                                            )
        puts "Product created: #{product.name}, Price: #{product.price}, Stock: #{product.stock_quantity}"
    end
end