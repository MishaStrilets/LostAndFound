CREATE TABLE IF NOT EXISTS thing(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20) NOT NULL,
    place VARCHAR(30),
    date VARCHAR(10),
    phone_number VARCHAR(15) NOT NULL,
    lost_or_found VARCHAR(8) NOT NULL
);
