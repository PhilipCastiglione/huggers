CREATE DATABASE huggers;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(200) NOT NULL,
  password_digest VARCHAR(300) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  dob DATE NOT NULL,
  gender VARCHAR(40) NOT NULL,
  profile_photo_id INTEGER,
  relationship INTEGER NOT NULL,
  partner_user_id INTEGER,
  location VARCHAR(100) NOT NULL,
  description VARCHAR(400)
);

CREATE TABLE profile_photos (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER NOT NULL,
  link VARCHAR(400) NOT NULL
);
