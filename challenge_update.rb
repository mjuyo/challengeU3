require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40.
product_stock_greater_40 = Product.where('stock_quantity > 40')

# Add one to the stock quantity of each of these products and then save these changes to the database.
product_stock_greater_40.each do |prod|
    prod.stock_quantity += 1
    prod.save
    puts "Updated product: #{prod.name}, Stock quantity: #{prod.stock_quantity}."
end
