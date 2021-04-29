# frozen_string_literal: true

class Booking
  attr_reader :starting_date, :ending_date, :user_id, :space_id

  def self.create(args = {})
    result = DBConnection.exec("INSERT INTO bookings (starting_date, ending_date, user_id, space_id)
    VALUES('#{args[:starting_date]}', '#{args[:starting_date]}', '#{args[:user_id]}', '#{args[:space_id]}')")
    DBConnection.exec("UPDATE spaces SET available = FALSE WHERE id = #{space_id};")
    new(
      starting_date: args[:starting_date],
      ending_date: args[:ending_date],
      user_id: args[:user_id],
      space_id: args[:space_id]
    )
  end

  def initialize(args = {})
    @id               = args[:id]
    @space_id         = args[:space_id]
    @user_id          = args[:user_id]
    # @starting_date    = find_space['available_from']
    # @ending_date      = find_space['available_to']
    @starting_date    = args[:starting_date]
    @ending_date      = args[:ending_date]
  end

  private

  # def find_space
  #   DBConnection.exec(
  #     "SELECT available_from, available_to FROM spaces
  #     INNER JOIN booking ON booking.space_id = spaces.id
  #     WHERE space_id = #{space_id}"
  #   )
  # end
end
