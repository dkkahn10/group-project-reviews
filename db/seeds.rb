# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

amanda = User.create(email: 'amanda@gmail.com', password: 'passtests', username: 'amanda', role: 'admin')
maryelaine = User.create(email: 'maryelaine@gmail.com', password: 'passtests', username: 'maryelaine', role: 'admin')
dustin = User.create(email: 'dustin@gmail.com', password: 'passtests', username: 'dustin')
jason = User.create(email: 'jason@gmail.com', password: 'passtests', username: 'jason')

bpg = Location.create(name_of_location: 'Boston Public Garden', description: 'Swan boats, beautiful greenery, and fall foliage as seasonally appropriate')
improv = Location.create(name_of_location: 'Improv Boston', description: 'A Camrbidge comedy club with several performances per week and improv and standup classes')
mikes = Location.create(name_of_location: 'Mike\'s Pastry', description: 'Cash only Italian pastry shop, beloved by tourists everywhere')
starbucks = Location.create(name_of_location: 'Starbucks', description: 'Starbucks Corporation is an American coffee company and coffeehouse chain. Starbucks was founded in Seattle, Washington in 1971. Today it operates 23,768 locations worldwide, including 13,107 in the United States. Starbucks is considered the main representative of "second wave coffee", initially distinguishing itself from other coffee-serving venues in the US by taste, quality, and customer experience, while popularizing darkly roasted coffee.')

Review.create(user_id: dustin.id, location_id: starbucks.id, intimacy_rating: 1, reasoning: 'I took a date here and for some reason she won\'t call me back')
Review.create(user_id: maryelaine.id, location_id: starbucks.id, intimacy_rating: 1, reasoning: 'it\'s starbucks tho')
Review.create(user_id: amanda.id, location_id: starbucks.id, intimacy_rating: 2, reasoning: 'Not a great place for a date. 2 stars in case it\'s PSL season')
Review.create(user_id: jason.id, location_id: starbucks.id, intimacy_rating: 3, reasoning: 'Great for no-pressure first dates')
