--
-- Créer un déclencheur "after_products_update" sur la table products: 
-- lorsque le stock physique devient inférieur au stock d'alerte, 
-- une nouvelle ligne est insérée dans la table commander_articles.
--

ALTER TABLE products ENGINE=InnoDB;

DELIMITER $$
CREATE TRIGGER after_products_update
AFTER UPDATE 
ON products
FOR EACH ROW

BEGIN
  DECLARE stock_physique INT;  
  DECLARE stock_alert INT;
  DECLARE diff_stock INT;

  SET stock_physique = (SELECT pro_stock FROM products WHERE pro_id = NEW.pro_id); 
  SET stock_alert = (SELECT pro_stock_alert FROM products WHERE pro_id = NEW.pro_id); 
  SET diff_stock = (stock_alert - stock_physique);

  IF (diff_stock > 0) 
  THEN
    INSERT INTO commander_articles(quantite, date_commande) VALUES(diff_stock, NOW());
  END IF;
END $$

