CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  days_booked VARCHAR (60) NOT NULL,
  booked BOOLEAN
);

ALTER TABLE bookings ADD COLUMN user_id INT REFERENCES users(id);
ALTER TABLE bookings ADD COLUMN space_id INT REFERENCES spaces(id);
