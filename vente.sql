CREATE DATABASE vente;

USE vente 


CREATE TABLE client (
       customer_id INT PRIMARY KEY , 
	   customer_name VARCHAR(30) NOT NULL ,
	   customer_tel VARCHAR(50) NOT NULL  
);

CREATE TABLE  produit (
       product_id INT PRIMARY KEY ,
	   product_name VARCHAR(30) NOT NULL ,
	   category VARCHAR(30) NOT NULL ,
	   price INT CHECK (price>0) 
	   
);

CREATE TABLE  commande(
       oder_id INT PRIMARY KEY ,
	   quantity INT NOT NULL ,
	   oder_date DATE NOT NULL ,
	   customer_id INT FOREIGN KEY REFERENCES  client (customer_id) NOT NULL ,
	   product_id INT FOREIGN KEY REFERENCES produit (product_id ) NOT NULL
	   
);



INSERT INTO client (customer_id , customer_name , customer_tel) VALUES
      (1,'Ahmed',775098640),
      (2,'Coulibaly',775098640),
	  (3,'Hassan',775098640),
	  (4,'Yasmine',775098640),
	  (5,'John',775098640);
      

INSERT INTO produit (product_id, product_name, category, price) VALUES 
       (1,'Biscuits','Snacks',10),
	   (2,'Bonbons','Bonbons',5), --price est n'est pas en int
	   (3,'Chips','Snacks',8),
	   (4,'Jus','Boissons',15),
	   (5,'Glace','Desserts',12);

INSERT INTO commande (oder_id, quantity, oder_date, customer_id, product_id) VALUES 
       (1,3,'2023-01-22',1,2),
	   (2,10,'2023-04-14',2,1),
	   (3,5,'2023-06-10',3,4),
	   (4,7,'2023-07-05',4,3),
	   (5,2,'2023-10-15',5,5);



UPDATE commande
SET quantity=6
WHERE oder_id=2;

/*UPDATE commande 
SET customer_id=4
WHERE oder_id=4;

UPDATE commande
SET customer_id=5
WHERE oder_id=5;
*/


DELETE FROM client
WHERE customer_id=3;


SELECT *
FROM client ;

SELECT *
FROM produit ;

SELECT *
FROM commande ;

SELECT customer_id, customer_name, customer_tel
FROM client;

SELECT product_id, product_name, category, price
FROM produit;

SELECT oder_id, quantity, oder_date, customer_id, product_id
FROM commande;

SELECT customer_id, customer_name, customer_tel
FROM client
WHERE customer_id=1 AND  customer_name='Ahmed' AND customer_tel= 00216572345678 ;



