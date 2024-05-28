require_relative 'ar.rb'

# Create three new products using the three different ways to create new AR objects.
# Ensure that all three new products are persisted to the database, without validations errors.

# Method 1
new_product = Product.new

new_product.name = "Peruvian mango"
new_product.description = "Mango from Peru"
new_product.price = 10.99
new_product.stock_quantity = 30

new_product.save 
puts new_product.inspect

# Method 2
passion_fruit = Product.new( name: "Passion fruit",
                             description: "Tropical fruit with sour flavour",
                             price: 12.99,
                             stock_quantity: 20 )

passion_fruit.save

# Method 3
lemons = Product.create( name: "Lemon",
                         description: "Green lemon",
                         price: 8.99,
                         stock_quantity: 15 )

# Create a Product object that is missing some required columns.
apples = Product.new( name: "Apple" )

# Attempt to save this product and print all the AR errors which are generated.
if (apples.save)
    puts "Apples product was saved to the database products table."
    puts apples.inspect
else
    puts "There was an error saving the apples product to the database."
    apples.errors.messages.each do |column, errors|
        errors.each do |error|
            puts "The #{column} property #{error}."
        end
    end
end

