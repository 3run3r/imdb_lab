require_relative('../db/sql_runner')
require_relative('movie')
require_relative('star')

class Casting

  attr_reader :id, :movie_id, :star_id
  attr_accessor :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO castings (
    movie_id,
    star_id,
    fee
    ) VALUES (
    $1,
    $2,
    $3
    ) RETURNING id;"
    values = [@movie_id, @star_id, @fee]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM castings;"
    castings = SqlRunner.run(sql)
    return map_castings(castings)
  end

  def self.delete_all
    sql = "DELETE FROM castings;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE castings SET fee = $1 WHERE id = $2;"
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_castings(casting_data)
    return casting_data.map {|casting| Casting.new(casting)}
  end

end
