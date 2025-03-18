-- 1. Récupérer les noms des clients qui ont commandé à la fois des « Bonbons » et des « Biscuits »,
--    ainsi que le coût total de ces produits commandés par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name IN ('Bonbons', 'Biscuits')
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.product_name) = 2;

-- 2. Récupérer les noms des clients qui ont commandé des « Cookies »,
--    ainsi que le coût total des cookies commandés par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Cookies'
GROUP BY c.customer_id, c.customer_name;

-- 3. Récupérer les noms des clients qui ont commandé des « Bonbons »,
--    ainsi que le coût total des bonbons commandés par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Bonbons'
GROUP BY c.customer_id, c.customer_name;

-- 4. Récupérer les noms des clients qui ont commandé de la « glace »,
--    ainsi que le coût total de la glace commandée par chaque client.
SELECT c.customer_name, 
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name = 'Glace'
GROUP BY c.customer_id, c.customer_name;

-- 5. Récupérer le nombre total de « Biscuits » et de « Bonbons » commandés par chaque client,
--    ainsi que le coût total de ces commandes.
SELECT c.customer_name, 
       SUM(cmd.quantity) AS total_quantity,
       SUM(p.price * cmd.quantity) AS total_cost
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
JOIN produit p ON cmd.product_id = p.product_id
WHERE p.product_name IN ('Biscuits', 'Bonbons')
GROUP BY c.customer_id, c.customer_name;

-- 6. Récupérer les noms des produits qui ont été commandés par au moins un client,
--    ainsi que la quantité totale de chaque produit commandé.
SELECT p.product_name, 
       SUM(cmd.quantity) AS total_quantity
FROM commande cmd
JOIN produit p ON cmd.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(cmd.quantity) > 0;

-- 7. Récupérer les noms des clients qui ont passé le plus de commandes,
--    ainsi que le nombre total de commandes passées par chaque client.
SELECT c.customer_name, 
       COUNT(cmd.oder_id) AS total_orders
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- 8. Récupérer les noms des produits qui ont été le plus commandés,
--    ainsi que la quantité totale de chaque produit commandé.
SELECT p.product_name, 
       SUM(cmd.quantity) AS total_quantity
FROM commande cmd
JOIN produit p ON cmd.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- 9. Récupérer les noms des clients qui ont passé une commande chaque jour de la semaine,
--    ainsi que le nombre total de commandes passées par chaque client.
SELECT c.customer_name, 
       COUNT(DISTINCT DAYOFWEEK(cmd.oder_date)) AS days_with_orders,
       COUNT(cmd.oder_id) AS total_orders
FROM commande cmd
JOIN client c ON cmd.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING days_with_orders = 7;
