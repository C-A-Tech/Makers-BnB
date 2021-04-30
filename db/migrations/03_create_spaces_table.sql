CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  name VARCHAR (60) NOT NULL,
  description VARCHAR (500) NOT NULL,
  price INT NOT NULL,
  available_from DATE,
  available_to DATE,
  available BOOLEAN
);
ALTER TABLE spaces ADD COLUMN user_id INT REFERENCES users(id);
ALTER TABLE spaces ADD COLUMN space_image VARCHAR (500);
