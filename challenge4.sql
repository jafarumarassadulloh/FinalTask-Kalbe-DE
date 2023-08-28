CREATE DATABASE KALBE;

USE KALBE;

CREATE TABLE Inventory (
    Item_code INT PRIMARY KEY,
    Item_name VARCHAR(255) UNIQUE,
    Item_price DECIMAL(10, 2),
    Item_total INT
);

INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES
    (2341, 'Promag Tablet', 3000, 100),
    (2342, 'Hydro Coco 250ML', 7000, 20),
    (2343, 'Nutrive Benecol 100ML', 20000, 30),
    (2344, 'Blackmores Vit C 500Mg', 95000, 45),
    (2345, 'Entrasol Gold 370G', 90000, 120);
   
SELECT *
FROM inventory;

SELECT 
	*
FROM Inventory
WHERE Item_total = (SELECT MAX(Item_total) FROM Inventory);

UPDATE inventory
SET Item_price=95000
WHERE Item_total = (SELECT max(Item_total) FROM inventory);

SELECT *
FROM inventory;


INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES
    (2343, 'Promag Tablet', 3000, 100);

DELETE FROM Inventory
WHERE Item_total = (SELECT MIN(Item_total) FROM Inventory);

SELECT *
FROM inventory;
