# frozen_string_literal: true

class Space
  attr_reader :id, :title, :description, :price, :location, :available_from, :available_to, :available, :user_id, :first_name, :last_name

  def self.create(args = {})
    DBConnection.exec(
      "INSERT INTO spaces (name, description, price, available_from, available_to, available, user_id) VALUES(
        '#{args[:title]}',
        '#{args[:description]}',
        '#{args[:price]}',
        '#{args[:available_from]}',
        '#{args[:available_to]}',
        'true',
        '#{args[:user_id]}'
      );"
    )
  end

  def self.all
    result = DBConnection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(
        id: space['id'],
        title: space['name'],
        description: space['description'],
        price: space['price'],
        available_from: space[:available_from],
        available_to: space[:available_to],
        available: space['available'],
        user_id: space['user_id'],
      )
    end
  end

  def initialize(args = {})
    @id               = args[:id]
    @title            = args[:title]
    @location         = args[:location]
    @description      = args[:description]
    @price            = args[:price]
    @user_id          = args[:user_id]
    @available        = args[:available]
    @available_from   = args[:available_from]
    @available_to     = args[:available_to]
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
