-- Cr�ation de la table Wine
CREATE TABLE Wine (
    NumW INT AUTO_INCREMENT PRIMARY KEY,
    Category VARCHAR(50),
    Year INT,
    Degree FLOAT
);

-- Cr�ation de la table Producer
CREATE TABLE Producer (
    NumP INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Region VARCHAR(50)
);

-- Cr�ation de la table Harvest
CREATE TABLE Harvest (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    NumP INT,
    NumW INT,
    Quantity INT,
    FOREIGN KEY (NumP) REFERENCES Producer(NumP),
    FOREIGN KEY (NumW) REFERENCES Wine(NumW)
);

-- Insertion des donn�es dans la table Wine
INSERT INTO Wine (Category, Year, Degree) VALUES
('Rouge', 2019, 13.5),
('Blanc', 2020, 12.0),
('Rose', 2018, 11.5),
('Red', 2021, 14.0),
('Sparkling', 2017, 10.5),
('Blanc', 2019, 12.5),
('Rouge', 2022, 13.0),
('Rose', 2020, 11.0),
('Rouge', 2018, 12.0),
('Sparkling', 2019, 10.0),
('Blanc', 2021, 11.5),
('Rouge', 2022, 15.0);

-- Insertion des donn�es dans la table Producer
INSERT INTO Producer (FirstName, LastName, Region) VALUES
('John', 'Smith', 'Sousse'),
('Emma', 'Johnson', 'Tunis'),
('Michael', 'Williams', 'Sfax'),
('Emily', 'Brown', 'Sousse'),
('James', 'Jones', 'Sousse'),
('Sarah', 'Davis', 'Tunis'),
('David', 'Miller', 'Sfax'),
('Olivia', 'Wilson', 'Monastir'),
('Daniel', 'Moore', 'Sousse'),
('Sophia', 'Taylor', 'Tunis'),
('Matthieu', 'Anderson', 'Sfax'),
('Am�lia', 'Thomas', 'Sousse');

-- Insertion des donn�es dans la table Harvest
INSERT INTO Harvest (NumP, NumW, Quantity) VALUES
(1, 1, 500),
(2, 2, 300),
(3, 3, 200),
(4, 4, 450),
(5, 5, 150),
(6, 6, 350),
(7, 7, 400),
(8, 8, 250),
(9, 9, 300),
(10, 10, 100),
(1, 1, 150),
(12, 12, 600);

-- Requ�tes SQL

-- 1. R�cup�rer une liste de tous les producteurs
SELECT * FROM Producer;

-- 2. Liste tri�e de producteurs par nom
SELECT * FROM Producer ORDER BY LastName;

-- 3. Liste de producteurs de Sousse
SELECT * FROM Producer WHERE Region = 'Sousse';

-- 4. Quantit� totale de vin produite avec le num�ro de vin 12
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE NumW = 12;

-- 5. Quantit� de vin produite pour chaque cat�gorie
SELECT w.Category, SUM(h.Quantity) AS TotalQuantity
FROM Wine w
JOIN Harvest h ON w.NumW = h.NumW
GROUP BY w.Category;

-- 6. Producteurs de Sousse ayant r�colt� au moins un vin > 300 litres
SELECT p.FirstName, p.LastName
FROM Producer p
JOIN Harvest h ON p.NumP = h.NumP
WHERE p.Region = 'Sousse' AND h.Quantity > 300
ORDER BY p.LastName, p.FirstName;

-- 7. Num�ros de vins avec un degr� > 12, produits par le producteur num�ro 24
SELECT h.NumW
FROM Harvest h
JOIN Wine w ON h.NumW = w.NumW
WHERE w.Degree > 12 AND h.NumP = 24;

-- 8. Producteur ayant produit la plus grande quantit� de vin
SELECT p.FirstName, p.LastName, MAX(h.Quantity) AS MaxQuantity
FROM Producer p
JOIN Harvest h ON p.NumP = h.NumP
GROUP BY p.NumP, p.FirstName, p.LastName
ORDER BY MaxQuantity DESC
LIMIT 1;

-- 9. Degr� moyen de vin produit
SELECT AVG(Degree) AS AverageDegree FROM Wine;

-- 10. Vin le plus ancien
SELECT * FROM Wine ORDER BY Year ASC LIMIT 1;

-- 11. Liste des producteurs et la quantit� totale produite
SELECT p.FirstName, p.LastName, SUM(h.Quantity) AS TotalQuantity
FROM Producer p
JOIN Harvest h ON p.NumP = h.NumP
GROUP BY p.NumP, p.FirstName, p.LastName;

-- 12. Liste des vins et les coordonn�es de leurs producteurs
SELECT w.NumW, w.Category, w.Year, w.Degree, p.FirstName, p.LastName, p.Region
FROM Wine w
JOIN Harvest h ON w.NumW = h.NumW
JOIN Producer p ON h.NumP = p.NumP;
