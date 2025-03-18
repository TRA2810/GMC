-- 1. R�cup�rer les noms des clients qui ont command� � la fois des � Bonbons � et des � Biscuits �,
--    ainsi que le co�t total de ces produits command�s par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name IN ('Bonbons', 'Biscuits')
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.product_name) = 2;

-- 2. R�cup�rer les noms des clients qui ont command� des � Cookies �,
--    ainsi que le co�t total des cookies command�s par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Cookies'
GROUP BY c.customer_id, c.customer_name;

-- 3. R�cup�rer les noms des clients qui ont command� des � Bonbons �,
--    ainsi que le co�t total des bonbons command�s par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Bonbons'
GROUP BY c.customer_id, c.customer_name;

-- 4. R�cup�rer les noms des clients qui ont command� de la � glace �,
--    ainsi que le co�t total de la glace command�e par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Glace'
GROUP BY c.customer_id, c.customer_name;

-- 5. R�cup�rer le nombre total de � Biscuits � et de � Bonbons � command�s par chaque client,
--    ainsi que le co�t total de ces commandes.
SELECT c.customer_name, 
       SUM(cmd.quantity) AS total_quantity,
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name IN ('Biscuits', 'Bonbons')
GROUP BY c.customer_id, c.customer_name;

-- 6. R�cup�rer les noms des produits qui ont �t� command�s par au moins un client,
--    ainsi que la quantit� totale de chaque produit command�.
SELECT p.product_name, 
       SUM(cmd.quantity) AS total_quantity
FROM commande cmd
JOIN produit p ON cmd.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(cmd.quantity) > 0;

-- 7. R�cup�rer les noms des clients qui ont pass� le plus de commandes,
--    ainsi que le nombre total de commandes pass�es par chaque client.
SELECT c.customer_name, 
       COUNT(cmd.oder_id) AS total_orders
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- 8. R�cup�rer les noms des produits qui ont �t� le plus command�s,
--    ainsi que la quantit� totale de chaque produit command�.
SELECT p.product_name, 
       SUM(cmd.quantity) AS total_quantity
FROM commande cmd
JOIN produit p ON cmd.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- 9. R�cup�rer les noms des clients qui ont pass� une commande chaque jour de la semaine,
--    ainsi que le nombre total de commandes pass�es par chaque client.
SELECT c.customer_name, 
       COUNT(DISTINCT DAYOFWEEK(cmd.oder_date)) AS days_with_orders,
       COUNT(cmd.oder_id) AS total_orders
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING days_with_orders = 7;
