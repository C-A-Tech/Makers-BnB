# frozen_string_literal: true

class Booking
  attr_reader :starting_date, :ending_date, :user_id, :space_id

  def self.create(args = {})
    result = DBConnection.exec(
      "INSERT INTO bookings (starting_date, ending_date, user_id, space_id)
      VALUES('#{args[:starting_date]}', '#{args[:ending_date]}', '#{args[:user_id]}', '#{args[:space_id]}')"
    )

    available_to =  DBConnection.exec("SELECT available_to FROM spaces WHERE id = #{args[:space_id]};").first["available_to"]
    DBConnection.exec("UPDATE spaces SET available = 'f' WHERE id = #{args[:space_id]};") if available_to == args[:ending_date]
    DBConnection.exec("UPDATE spaces SET available_from= '#{args[:ending_date]}' WHERE id = #{args[:space_id]};")

    new(
      starting_date: args[:starting_date],
      ending_date: args[:ending_date],
      user_id: args[:user_id],
      space_id: args[:space_id]
    )
  end

  ## added by jess
  def self.retrieve(user_id)
    result = DBConnection.exec("SELECT * FROM bookings WHERE user_id = #{user_id};")

    result.map do |row|
      Booking.new(
        starting_date: row['starting_date'],
        ending_date: row['ending_date'],
        user_id: row['user_id'],
        space_id: row['space_id'],
      )
    end
  end
  ## added by jess

  def initialize(args = {})
    @id               = args[:id]
    @space_id         = args[:space_id]
    @user_id          = args[:user_id]
    @starting_date    = args[:starting_date]
    @ending_date      = args[:ending_date]
  end
end
