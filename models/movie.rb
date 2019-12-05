require_relative('../db/sql_runner')
require_relative('star')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (
    title,
    genre
    ) VALUES (
    $1,
    $2
    ) RETURNING id;"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies;"
    movies = SqlRunner.run(sql)
    return self.map_movies(movies)
  end

  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE movies SET title = $1, genre = $2 WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_movies(movies_data)
    result = movies_data.map {|movie| Movie.new(movie)}
    return result
  end

end
