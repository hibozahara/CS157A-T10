-- Initialize Schema--  

DROP DATABASE IF EXISTS FireStock;
CREATE DATABASE FireStock;
USE FireStock;

-- Entity Sets
--  User
CREATE TABLE IF NOT EXISTS user (
	userId BIGINT UNSIGNED,
	email VARCHAR(255),
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (userId)
);

-- Subclass of user, Admin
CREATE TABLE IF NOT EXISTS admin (
	userId BIGINT UNSIGNED,
    adminId VARCHAR(255) NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(userId)
); 

-- Type
CREATE TABLE IF NOT EXISTS type (
	typeId BIGINT UNSIGNED,
    typeName VARCHAR(255) NOT NULL,
    PRIMARY KEY (typeId)
);
 
 -- County
 CREATE TABLE IF NOT EXISTS county (
	countyId BIGINT unsigned,
    countyName VARCHAR(255) NOT NULL,
    PRIMARY KEY(countyId)
 );
 
-- City
CREATE TABLE IF NOT EXISTS city (
	cityId BIGINT unsigned,
    cityName  VARCHAR(255) NOT NULL,
    PRIMARY KEY (cityId)
); 

 -- Weak set of User, Donation
 CREATE TABLE IF NOT EXISTS donation (
	donationId BIGINT UNSIGNED,
    userId BIGINT UNSIGNED,
    typeId BIGINT UNSIGNED,
    countyId BIGINT UNSIGNED,
    cityId BIGINT UNSIGNED,
    quantity int NOT NULL,
    picture LONGBLOB, 
    PRIMARY KEY (donationId),
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (typeId) REFERENCES type(typeId),
    FOREIGN KEY (countyId) REFERENCES county(countyId),
    FOREIGN KEY (cityId) REFERENCES city(cityId)
 );

-- Relationships
--  Requests
CREATE TABLE IF NOT EXISTS request (
	userId BIGINT UNSIGNED,
    donationId BIGINT UNSIGNED,
    status VARCHAR(255),
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (donationId) REFERENCES donation(donationId)
);

-- Has
CREATE TABLE IF NOT EXISTS has (
	donationId BIGINT UNSIGNED, 
    typeId BIGINT UNSIGNED,
    FOREIGN KEY (donationId) REFERENCES donation(donationId),
    FOREIGN KEY (typeId) REFERENCES type(typeId)
);

-- found_in
CREATE TABLE IF NOT EXISTS found_in (
	donationId BIGINT UNSIGNED,
    countyId BIGINT UNSIGNED,
    FOREIGN KEY (donationId) REFERENCES donation(donationId),
    FOREIGN KEY (countyId) REFERENCES county(countyId)
);

-- Composed   
CREATE TABLE IF NOT EXISTS composed (
	cityId BIGINT UNSIGNED,
    countyId BIGINT UNSIGNED,
    FOREIGN KEY (cityId) REFERENCES city(cityId),
    FOREIGN KEY (countyId) REFERENCES county(countyId)
);