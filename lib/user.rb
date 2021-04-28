# frozen_string_literal: true

require 'pg'
require './lib/db_connection'

class User
  include DBConnection

  def self.create(first_name:, last_name:, email:, password:)
    # this line can be deleted, it's never used.
    # user = new(id: nil, first_name: first_name, last_name: last_name, email: email, password: password)
    result = DBConnection.exec(
      "INSERT INTO users (first_name, last_name, email, password)
      VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}')
      RETURNING id, first_name, last_name, email, password"
    )
    # retrieving the user that has been put into the database
    user = new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  attr_reader :id, :first_name, :last_name, :email, :password

  def initialize(id: nil, first_name:, last_name:, email:, password:)
    @id         = id
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @password   = password
  end
end
