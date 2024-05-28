require_relative 'ar.rb'
require 'faker'

# Find all the categories in the database (including those that you added using Faker). 
categories = Category.all

# Display all category names and their associated products (name and price) in a nicely formatted list.
categories.each do |category|
    puts "-" * 40 
    puts "Category: #{category.name}"

    category.products.each do |product|
        puts "Product: #{product.name} => Price: $ #{'%.2f' % product.price}"
    end
    
end