# frozen_string_literal: true

require './lib/db_connection'

class Space
  attr_reader :title, :description, :price, :location, :user_id, :first_name, :last_name

  def self.create(args = {})
    DBConnection.exec(
      "INSERT INTO spaces (name, description, price, user_id) VALUES(
        '#{args[:title]}',
        '#{args[:description]}',
        '#{args[:price]}',
        '#{args[:user_id]}'
      );"
    )
  end

  def self.all
    result = DBConnection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(
        title: space['name'],
        description: space['description'],
        price: space['price'],
        user_id: space['user_id']
      )
    end
  end

  def initialize(args = {})
    @title            = args[:title]
    @location         = args[:location]
    @description      = args[:description]
    @price            = args[:price]
    @user_id          = args[:user_id]
    @first_name       = find_user['first_name']
    @last_name        = find_user['last_name']
  end

  private

  def find_user
    DBConnection.exec(
      "SELECT first_name, last_name FROM users
      INNER JOIN spaces ON users.id = spaces.user_id
      WHERE user_id = #{user_id}"
    ).first
  end
end
