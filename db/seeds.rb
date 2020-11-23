require "open-uri"
require "faker"

10.times do |i|
    print "Seeding." +  ("." * (i % 3)) + "  \r"
    sleep(0.2)
end

puts " "

puts 'Cleaning up database'
Review.destroy_all
puts 'Reviews are cleaned'
Product.destroy_all
puts 'Products are cleaned'
puts 'Database is cleaned'

puts 'Creating a category'
category = Category.create(title: "Beauty", description: "this is the category description")
puts 'Reviews are cleaned'

10.times do |i|
    print "Creating some new nice Produts." +  ("." * (i % 3)) + "  \r"
    sleep(0.2)
end

20.times do
  product = Product.create(
    title: Faker::Name.first_name,
    description: "This is a random description",
    price: rand(10..500),
    category: category,
    amount: rand(1..20)
    )
  puts "Product #{product.id} was created"
end
