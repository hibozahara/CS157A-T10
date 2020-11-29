-- Insert into Tables
-- 1 user
INSERT IGNORE INTO user (email, name, password, salt) 
VALUES 
("ghaviv@icloud.com", "ghaviv", "ghaviv123", 1),
("warrior@yahoo.com", "warrior", "warriorsfan", 1),
("peterhoeg@msn.com", "peter1998", "1998peter", 1),
("stern@optonline.net", "stern", "stern", 1),
("juerd@aol.com", "juerd", "juerd123", 1),
("sassen@verizon.net", "sassen", "sassen1000", 1),
("elmer@verizon.net", "elmerglue", "elmers!@#", 1),
("pdbaby@comcast.net", "pdbabyxx", "qwerasdf1234", 1),
("fatelk@outlook.com", "fatelk", "password", 1),
("curly@yahoo.com", "curlyguy", "curl1234", 1),
("kingjoshi@att.net", "kingjoshi", "king!@#$", 1),
("biglou@live.com", "biggestlou", "big1212", 1),
("thomas.wang@sjsu.edu", "t.wang", "thomas123", 5),
("jesusemmanuel.fuentesnava@sjsu.edu", "jesus.emmanuel", "jesus123", 1),
("hibo.osman@sjsu.edu", "hibo.osman", "hibo123", 1);

-- 2 admin
INSERT IGNORE INTO admin (userId, adminId)
VALUES 
(13, 1),
(14, 2),
(15, 3),
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(11, 14),
(12, 15);

-- 3 type
INSERT IGNORE INTO type (typeName)
VALUES
("water"),
("food"),
("beverages"),
("clothing"),
("medical supply"),
("paper products"),
("cleaning supplies"),
("baby supplies"),
("shoes"),
("camping supplies"),
("batteries"),
("personal care supplies"),
("cars"),
("appliances"),
("furniture");

-- 4 county
INSERT IGNORE INTO county (countyName)
VALUES
("Alameda"),
("Butte"),
("El Dorado"),
("Fresno"),
("Los Angeles"),
("Orange"),
("Placer"),
("Sacramento"),
("San Bernardino"),
("San Diego"),
("San Francisco"),
("San Mateo"),
("Santa Clara"),
("Tehama"),
("Sonoma");

-- 5 city
INSERT IGNORE INTO city (cityName)
VALUES
("Oakland"),
("Oroville"),
("Placerville"),
("Fresno"),
("Los Angeles"),
("Santa Ana"),
("Auburn"),
("Sacramento"),
("San Bernardino"),
("San Diego"),
("San Francisco"),
("Redwood City"),
("San Jose"),
("Red Bluff"),
("Santa Rosa");

-- 6 donation
INSERT IGNORE INTO donation (userId, typeId, countyId, cityId, quantity, picture)
VALUES
(1, 1, 3, 3, 2, null),
(2, 2, 2, 2, 5, null),
(3, 4, 5, 5, 1, null),
(4, 3, 4, 4, 1, null),
(5, 6, 2, 2, 3, null),
(6, 8, 1, 1, 1, null),
(7, 9, 6, 6, 5, null),
(8,10, 7, 7, 10, null),
(9, 11, 8, 8, 1, null),
(10, 15, 2, 2, 2, null),
(11, 10, 1, 1, 1, null),
(12, 14, 1, 1, 3, null),
(13, 13, 9, 9, 5, null),
(14, 13, 8, 8, 3, null),
(15, 12, 11, 11, 3, null);

-- 7 Request
INSERT IGNORE INTO request (userId, donationId, status) 
VALUES
(1, 1, "Pending"),
(2, 2, "Pending"),
(3, 3, "Accepted"),
(4, 4, "Declined"),
(5, 5, "Pending"),
(6, 6, "Pending"),
(7, 7, "Accepted"),
(8, 8, "Accepted"),
(9, 9, "Accepted"),
(10, 10, "Accepted"),
(11, 11, "Declined"),
(12, 12, "Accepted"),
(13, 13, "Pending"),
(14, 14, "Pending"),
(15, 15, "Pending");

-- 8 has
INSERT IGNORE INTO has (donationId, typeId)
VALUES
(1, 1),
(2, 5),
(3, 5),
(4, 7),
(5, 2),
(6, 3),
(7, 4),
(8, 6),
(9, 8),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13);

-- 9  found_in
INSERT IGNORE INTO found_in (donationId, countyId)
VALUES
(1, 2),
(2, 4),
(3, 1),
(4, 3),
(5, 8),
(6, 6),
(7, 7),
(8, 9),
(9, 10),
(10, 10),
(11, 11),
(12, 15),
(13, 13),
(14, 13),
(15, 13);

-- 10 composed
INSERT IGNORE INTO composed (cityId, countyId) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);


