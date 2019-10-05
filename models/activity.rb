require_relative( '../db/sql_runner' )

class Activity

  attr_reader :id
  attr_accessor :class_name, :day, :class_time

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @day = options['day']
    @class_time = options['class_time']
  end

  def save()
    sql = "INSERT INTO activities
    (
      class_name,
      day,
      class_time
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@class_name, @day, @class_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE activities
    SET
    (
      class_name,
      day,
      class_time
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@class_name, @day, @class_time, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM activities where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

  end
