CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  name VARCHAR (60) NOT NULL,
  description VARCHAR (500) UNIQUE NOT NULL,
  price INT NOT NULL,
  availability BOOLEAN
);
ALTER TABLE spaces ADD COLUMN user_id INT REFERENCES users(id);