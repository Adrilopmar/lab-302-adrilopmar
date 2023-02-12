CREATE SCHEMA lab302;
CREATE TABLE customer (
	id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255),
    customer_status ENUM('None', 'Silver', 'Gold'),
    mileage INT,
    PRIMARY KEY (id)
);
CREATE TABLE aircraft (
	model VARCHAR(255),
    seats INT,
	PRIMARY KEY (model)
);
CREATE TABLE flight (
	flight_number VARCHAR(255),
    mileage INT,
    PRIMARY KEY (flight_number)
);
CREATE TABLE flight_details (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
    aircraft_model VARCHAR(255),
    flight_number VARCHAR(255),
    PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (aircraft_model) REFERENCES aircraft(model),
    FOREIGN KEY (flight_number) REFERENCES flight(flight_number)
);
INSERT INTO customer (customer_name, customer_status, mileage) VALUES 
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO aircraft (model, seats) VALUES 
('Boeing747', 400),
('AirbusA330', 236),
('Boeing777', 264);

INSERT INTO flight (flight_number, mileage) VALUES 
('DL143', 135),
('DL122', 4370),
('DL53', 2078),
('DL222', 1765),
('DL37', 531);

INSERT INTO flight_details (customer_id, aircraft_model, flight_number) VALUES 
(1,'Boeing747','DL143'),
(1,'AirbusA330','DL122'),
(2,'AirbusA330','DL122'),
(3,'AirbusA330','DL122'),
(3,'Boeing777','DL53'),
(4,'Boeing747','DL143'),
(3,'Boeing777','DL222'),
(5,'Boeing747','DL143'),
(6,'Boeing777','DL222'),
(7,'Boeing777','DL222'),
(5,'AirbusA330','DL122'),
(4,'Boeing747','DL37'),
(8,'Boeing777','DL222');

-- 3
SELECT COUNT(*) FROM flight;
-- 4
SELECT AVG(mileage) FROM flight;

-- 5
SELECT AVG(seats) FROM aircraft;

-- 6
SELECT customer_status, AVG(mileage) FROM customer GROUP BY customer_status;

-- 7
SELECT customer_status, MAX(mileage) FROM customer GROUP BY customer_status;

-- 8
SELECT COUNT(*) FROM aircraft WHERE model LIKE '%Boeing%';

-- 9
SELECT flight_number, mileage FROM flight WHERE mileage BETWEEN 300 AND 2000;

-- 10 
SELECT c.customer_status, AVG(f.mileage) FROM customer c
JOIN flight_details fd ON c.id = fd.customer_id
JOIN flight f ON f.flight_number = f.flight_number
GROUP BY c.customer_status;

-- 11 
SELECT aircraft_model, COUNT(aircraft_model) AS times_booked
FROM flight_details fd
JOIN customer c ON fd.customer_id = c.id
WHERE c.customer_status = 'Gold'
GROUP BY aircraft_model
ORDER BY times_booked DESC;


