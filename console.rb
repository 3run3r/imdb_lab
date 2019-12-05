require('pry')
require_relative('models/movie')
require_relative('models/casting')
require_relative('models/star')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({ 'title' => 'Die Hard', 'genre' => 'action'})
movie1.save()
movie2 = Movie.new({ 'title' => 'Zombieland', 'genre' => 'horror'})
movie2.save()
movie3 = Movie.new({ 'title' => 'Star Wars', 'genre' => 'sci-fi'})
movie3.save()

star1 = Star.new({ 'first_name' => 'Bruce', 'last_name' => 'Willis'})
star1.save()
star2 = Star.new({ 'first_name' => 'Emma', 'last_name' => 'Stone'})
star2.save()
star3 = Star.new({ 'first_name' => 'Carrie', 'last_name' => 'Fisher'})
star3.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 500_000})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 50_000})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 300_000})
casting3.save()

binding.pry
nil
