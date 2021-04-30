CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  starting_date DATE,
  ending_date DATE
);

ALTER TABLE bookings ADD COLUMN user_id INT REFERENCES users(id);
ALTER TABLE bookings ADD COLUMN space_id INT REFERENCES spaces(id);
