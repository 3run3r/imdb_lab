require('pry')
require_relative('models/movie')
require_relative('models/casting')
require_relative('models/star')

Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({ 'title' => 'Die Hard', 'genre' => 'action'})
movie1.save()



star1 = Star.new({ 'first_name' => 'Bruce', 'last_name' => 'Willis'})
star1.save()

binding.pry
nil
