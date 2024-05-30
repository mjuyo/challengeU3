require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Use the Product class to find (any) product from the database.
product = Product.first

# Inspect the Product object you have retrieved.
puts product.inspect

# In a comment within your product.rb file, record all the columns that exist in the products table.
    # Columns in products table:
    # id: integer
    # name: string
    # description: string
    # price: decimal
    # stock_quantity: integer
    # category_id: integer
    # created_at: datetime
    # updated_at: datetime

# Based on the columns you find, can you determine if the products table has an association with any other tables? If so, what table?
    # The products tables has an association with the categories table, we can find a categoriy_id column.

# Use ActiveRecord to find and print out:
    # Total number of products
total_products = Product.count
puts "The total number of products: #{total_products}"

    # The names of all products above $10 with names that begin with the letter C.
products_above_10_letter_c = Product.where('price > 10 AND name LIKE "C%"') 
puts "Products above $10 with names starting with C: "
products_above_10_letter_c.each do |product|
    puts " #{product.name} is $#{product.price}."
end

    # Total number of products with a low stock quantity. (Low is defined as less than 5 in stock.)
total_products_low_stock = Product.where('stock_quantity < 5').count
puts "Total of low stock products: #{total_products_low_stock}"


# Find the name of the category associated with one of the products you have found. (You should do this without referencing the products foreign key value. Use the product's "belongs to" association instead.)
product_x = Product.find(160)

product_cat = product_x.category

puts "The product #{product_x.name} has a #{product_cat.name} category."

# Find a specific category and use it to build and persist a new product associated with this category. (You should do this without manually setting the products foreign key. Look at the end of this example file to see how to build an ActiveRecord object by way of an "has many" association.)
condiments = Category.where(:name => "Condiments").first

condiments.products.each { |prod| puts prod.name }

new_product = Product.new( name: "Cinnamon Spice",
                           description: "Cinnamon from South America",
                           price: 2.99,
                           stock_quantity: 60 )

new_product.category = condiments
new_product.save

puts new_product.inspect 

# Find a specific category and then use it to locate all the the associated products over a certain price.
products_over_20_price = condiments.products.where('price > 20').count 

products_over_20_price.inspect

puts "Products with price over 20$ in #{condiments.name} category: #{products_over_20_price}."
