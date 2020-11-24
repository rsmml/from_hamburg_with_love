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
Category.destroy_all
puts 'Categories are cleanead'
puts 'Database is cleaned'

puts 'Creating a category'
face = Category.create(title: "Face", description: "this is the category description")
hands = Category.create(title: "Hands", description: "this is the category description")
body = Category.create(title: "Full Body", description: "this is the category description")
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
    category: [face, hands, body].sample,
    amount: rand(1..20)
    )
  puts "Product #{product.id} was created"
end
