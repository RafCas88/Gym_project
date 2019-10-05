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

  def members
    sql = "SELECT members.* FROM members
    INNER JOIN registrations
    ON registrations.member_id = members.id
    WHERE activity_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM activities"
    results = SqlRunner.run( sql )
    return results.map { |activity| Activity.new( activity ) }
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

    def self.delete_all
      sql = "DELETE FROM activities"
      SqlRunner.run( sql )
    end
  end
