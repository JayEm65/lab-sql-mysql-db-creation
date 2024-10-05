-- Create a new schema for the car dealership
CREATE SCHEMA IF NOT EXISTS schema_lab;

-- Create the database for the car dealership
CREATE DATABASE IF NOT EXISTS car_dealership;

-- Use the car_dealership database for subsequent operations
USE car_dealership;

-- Create the cars table to store vehicle information
CREATE TABLE IF NOT EXISTS cars (
    vin VARCHAR(100) PRIMARY KEY,  -- Vehicle Identification Number (VIN)
    manufacturer VARCHAR(100),       -- Car manufacturer
    model VARCHAR(100),              -- Car model
    year INT,                        -- Manufacturing year
    color VARCHAR(50)                -- Color of the car
);

-- Create the customers table to store customer information
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique customer ID
    name VARCHAR(100),                           -- Customer's name
    phone_number VARCHAR(20),                    -- Customer's phone number
    email VARCHAR(100),                          -- Customer's email address
    address VARCHAR(255),                        -- Customer's address
    city VARCHAR(100),                           -- City of residence
    state_province VARCHAR(100),                 -- State or province
    country VARCHAR(100),                        -- Country
    zip_postal_code VARCHAR(20)                  -- ZIP or postal code
);

-- Create the salespersons table to store salesperson information
CREATE TABLE IF NOT EXISTS salespersons (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique staff ID
    name VARCHAR(100),                         -- Salesperson's name
    store VARCHAR(100)                         -- Store location
);

-- Create the invoices table to track sales transactions
CREATE TABLE IF NOT EXISTS invoices (
    invoice_number INT PRIMARY KEY AUTO_INCREMENT,  -- Unique invoice number
    date DATE,                                     -- Date of the invoice
    car_vin VARCHAR(100),                          -- Foreign key referencing cars table
    customer_id INT,                               -- Foreign key referencing customers table
    staff_id INT,                                  -- Foreign key referencing salespersons table
    FOREIGN KEY (car_vin) REFERENCES cars(vin),   -- Establishes relationship with cars table
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),  -- Establishes relationship with customers table
    FOREIGN KEY (staff_id) REFERENCES salespersons(staff_id)    -- Establishes relationship with salespersons table
);
