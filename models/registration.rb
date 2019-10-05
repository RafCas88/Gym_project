require_relative( '../db/sql_runner' )

class Registration

  attr_reader :member_id, :activity_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @activity_id = options['activity_id'].to_i
  end

  def save()
    sql = "INSERT INTO registrations
    (
      member_id,
      activity_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@member_id, @activity_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE registrations
    SET
    (
      member_id,
      activity_id,
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@member_id, @activity_id, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM registrations where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

end
