# frozen_string_literal: true

require 'pg'
# ADDED IN BY JESS to clear out USERS table and remake it for every test
p 'Setting up test database!'
def setup_test_database
  connection = PG.connect(dbname: 'airbnb_test')
  # connection.exec("TRUNCATE bookmarks;")
  connection.exec('DROP TABLE spaces;')
  connection.exec('DROP TABLE users;')
  connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY,first_name VARCHAR (60) NOT NULL,
    last_name VARCHAR (60) NOT NULL,
    email VARCHAR (60) UNIQUE NOT NULL,
    password VARCHAR (60) NOT NULL
  );")
  connection.exec("CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    name VARCHAR (60) NOT NULL,
    description VARCHAR (500) UNIQUE NOT NULL,
    price INT NOT NULL,
    availability BOOLEAN,
    user_id INT REFERENCES users(id)
  );")
end
