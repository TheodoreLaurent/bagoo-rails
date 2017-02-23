# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bag.destroy_all
User.destroy_all

user1 = User.create({
  email: 'remi.dyvoire@gmail.com',
  password: '123456',
  })

user2 = User.create({
  email: 'bob@gmail.com',
  password: '654321',
  })

bag1 = Bag.create({
  title: 'A tasty Bag',
  category: 'Travel',
  brand: 'Vuitton',
  capacity: '30',
  price_per_day: '30',
  description: 'great bag',
  datein: '01 Jan 2017',
  dateout: '31 Dec 2017',
  address: "22 Elder Street London"
  })

bag2 = Bag.create({
  title: 'A sumptious handbag',
  category: 'Luxury',
  brand: 'Gucci',
  capacity: '10',
  price_per_day: '100',
  description: 'great luxury bag',
  datein: '01 Feb 2017',
  dateout: '01 Nov 2017',
  address: 'WC1N 3LE'
  })


bag1.user = user1
bag2.user = user2

user1.save!
user2.save!

bag1.save!
bag2.save!



booking1 = Booking.new({
  check_out: 'Date.new',
  check_in: 'Date.new',
  total_price: '120',

  })

booking2 = Booking.new({
  check_out: 'Date.new',
  check_in: 'Date.new',
  total_price: '20',

  })





booking1.user = user1
booking1.bag = bag1

booking2.user = user2
booking2.bag = bag2


booking1.save!
booking2.save!


