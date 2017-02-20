# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bags = Bag.create([{ category: 'travel', brand: 'Vuitton', capacity: '30', price_per_day: '30', description: 'great bag' }, { category: 'Luxury', brand: 'Gucci', capacity: '10', price_per_day: '100', description: 'great luxury bag' }])
