require_relative 'ar.rb'

# Find one of the products you created in challenge_create.rb and delete it from the database.
product_delete = Product.where(:name => "Lemon").first
puts product_delete.inspect

product_delete.destroy unless product_delete.nil?
puts product_delete.inspect
