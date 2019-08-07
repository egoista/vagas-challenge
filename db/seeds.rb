# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location_a = Location.create(name: 'A')
location_b = Location.create(name: 'B')
location_c = Location.create(name: 'C')
location_d = Location.create(name: 'D')
location_e = Location.create(name: 'E')
location_f = Location.create(name: 'F')

Connection.create(
  [
    { first_location: location_a, second_location: location_b, distance: 5 },
    { first_location: location_b, second_location: location_c, distance: 7 },
    { first_location: location_c, second_location: location_e, distance: 4 },
    { first_location: location_b, second_location: location_d, distance: 3 },
    { first_location: location_e, second_location: location_d, distance: 10 },
    { first_location: location_d, second_location: location_f, distance: 8 },
  ]
)