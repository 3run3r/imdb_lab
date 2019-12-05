require('pry')
require_relative('models/movie')
require_relative('models/casting')
require_relative('models/star')

Movie.delete_all()

movie1 = Movie.new({ 'title' => 'Die Hard', 'genre' => 'action'})
movie1.save()

binding.pry
nil
