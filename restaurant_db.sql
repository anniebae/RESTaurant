CREATE DATABASE restaurant_db;

\c restaurant_db

CREATE TABLE foods (
	name VARCHAR(200), 
	price INTEGER, 
	id SERIAL PRIMARY KEY
);
INSERT INTO foods (name, price) VALUES ('Pasta', 15);
INSERT INTO foods (name, price) VALUES ('Sandwich', 11);
INSERT INTO foods (name, price) VALUES ('Salad', 14);

CREATE TABLE parties (
	name VARCHAR(100), 
	size_of_party INTEGER, 
	id SERIAL PRIMARY KEY
);
INSERT INTO parties (name, size_of_party) VALUES ('Bae', 4);
INSERT INTO parties (name, size_of_party) VALUES ('Michalakis', 6);
INSERT INTO parties (name, size_of_party) VALUES ('Haynsworth', 9);
INSERT INTO parties (name, size_of_party) VALUES ('Turner', 11);
INSERT INTO parties (name, size_of_party) VALUES ('Smith', 90);

CREATE TABLE orders (
	food_id INTEGER,
	party_id INTEGER,
	id SERIAL PRIMARY KEY
);