--
-- A partir de la base "afpa_gescom" créez une vue qui affiche le catalogue produits. L'id, la référence 
-- et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.
--

CREATE VIEW v_produits_categories
AS
SELECT pro_id, pro_ref, pro_name, cat_id, cat_name 
FROM products
JOIN categories
ON pro_cat_id = cat_id

