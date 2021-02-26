--
-- A partir de la table orders_details, afficher par code produit, la somme des quantités commandées et le prix total correspondant: 
-- on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.
--

CREATE VIEW v_Details
AS
SELECT ode_pro_id AS CodeProduit, SUM(ode_quantity) AS QuantiteTotal, SUM(ode_unit_price) AS PrixTotal
FROM orders_details
GROUP BY ode_pro_id




--
-- Afficher les ventes dont le code produit est ZOOM (affichage de toutes les colonnes de la table orders_details).
--

CREATE VIEW v_Ventes_Zoom
AS
SELECT * 
FROM orders_details