DROP TABLE registrations;
DROP TABLE members;
DROP TABLE activities;

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255)
);

CREATE TABLE activities
(
  id SERIAL8 primary key,
  class_name VARCHAR(255) not null,
  day VARCHAR(255),
  class_time VARCHAR(255)
);

CREATE TABLE registrations
(
  id SERIAL8 primary key,
  member_id INT8 references members(id),
  activity_id INT8 references activities(id)
);
