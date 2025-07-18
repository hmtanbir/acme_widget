require_relative 'lib/calculation'

# Terminal input
puts 'Welcome to Acme Widget Co Basket System'
puts 'Available products:'

PRODUCTS.each do |p|
  puts "  - #{p.name} (Code: #{p.code}, Price: $#{p.price})"
end

puts 'Available offers:'

PROMOTIONS.each do |promotion|
  puts "  - #{promotion.description}"
end

puts 'Delivery Rules:'
DELIVERY_RULES.each do |p|
  puts "  - Order #{p[0]} under cost #{p[1]}"
end

puts '  - Orders of $90 or more have free delivery'

puts "\nEnter product codes separated by commas (e.g. R01,G01,B01):"
input = gets.chomp
codes = input.gsub(/\s+/, "").split(',')

total_cost = Calculation.new(codes).total

puts "\n Total cost: #{total_cost}"
