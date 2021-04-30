# frozen_string_literal: true

class User
  # include DBConnection

  attr_reader :id, :first_name, :last_name, :email, :password

  def self.create(first_name:, last_name:, email:, password:)
    result = DBConnection.exec(
      "INSERT INTO users (first_name, last_name, email, password)
      VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}')
      RETURNING id, first_name, last_name, email, password"
    )
    new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.authenticate(email:, password:)
    result = DBConnection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless result[0]['password'] == password
    new(
      id: result[0]['id'],
      first_name: result[0]['first_name'],
      last_name: result[0]['last_name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def initialize(id: nil, first_name:, last_name:, email:, password:)
    @id         = id
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @password   = password
  end
end
