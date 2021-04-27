CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  name VARCHAR (60) NOT NULL,
  description VARCHAR (500) UNIQUE NOT NULL,
  price INTEGER (4) NOT NULL,
  availability BOOLEAN
  user_id INT REFERENCES users(id)
);
