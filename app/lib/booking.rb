class Booking

  attr_reader :id
  # booking_id        = 4
  # space_id          = 12
  # user_id (client)  = 20
  # days_booked       = [Mon, Tue, Fri]
  # booked?           = BOOL
  def self.create(args = {})

    result = DBConnection.exec("INSERT INTO bookings(days_booked, booked, user_id, space_id)
    VALUES('#{args[:days_booked]}','#{args[:booked]}','#{args[:user_id]}', '#{args[:space_id]}' RETURNING id)")
    booking = new(id: result[0]['id'])
  end
  def initialize(args = {})
    @id = id
  end
end
