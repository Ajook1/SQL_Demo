-- Create Database
CREATE DATABASE WasteManagement;
USE WasteManagement;

-- Table: Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    registration_date DATE
);

-- Table: WasteTypes
CREATE TABLE WasteTypes (
    waste_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50),
    description TEXT
);

-- Table: WasteEntries
CREATE TABLE WasteEntries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    waste_type_id INT,
    weight_kg DECIMAL(5,2),
    entry_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (waste_type_id) REFERENCES WasteTypes(waste_type_id)
);

-- Table: Transactions
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    entry_id INT,
    amount_paid DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (entry_id) REFERENCES WasteEntries(entry_id)
);

-- Sample Data
INSERT INTO Users (name, email, city, registration_date)
VALUES
('Anil Kumar', 'anil@example.com', 'Kochi', '2024-01-01'),
('Sneha Ramesh', 'sneha@example.com', 'Trivandrum', '2024-01-10');

INSERT INTO WasteTypes (type_name, description)
VALUES
('Plastic', 'Recyclable plastic materials'),
('Organic', 'Biodegradable organic waste'),
('Metal', 'Recyclable metal items');

INSERT INTO WasteEntries (user_id, waste_type_id, weight_kg, entry_date)
VALUES
(1, 1, 4.5, '2024-02-01'),
(1, 2, 2.0, '2024-02-03'),
(2, 3, 5.0, '2024-02-05');

INSERT INTO Transactions (entry_id, amount_paid, transaction_date)
VALUES
(1, 150.00, '2024-02-02'),
(2, 80.00, '2024-02-04');
