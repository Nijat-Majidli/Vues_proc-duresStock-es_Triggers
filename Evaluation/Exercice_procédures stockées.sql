--
-- A partir de la base "afpa_gescom" créez la procédure stockée "facture" qui permet d'afficher les 
-- informations nécessaires à une facture en fonction d'un numéro de commande. 
-- Cette procédure doit sortir le montant total de la commande.
--

DELIMITER |

CREATE PROCEDURE facture(IN p_numero_commande INT(10))

BEGIN
   SELECT sup_name, sup_city, sup_address, sup_zipcode, sup_contact,  
          cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, 
          pro_ref, pro_color, pro_name, pro_desc,
          ode_unit_price, ode_discount, ode_quantity, SUM(ode_unit_price * ode_quantity) - ode_discount AS montantTotal   
   FROM customers
   JOIN countries
   ON cus_countries_id = cou_id
   JOIN suppliers 
   ON sup_countries_id = cou_id
   JOIN products
   ON pro_sup_id = sup_id
   JOIN orders_details
   ON ode_pro_id = pro_id
   JOIN orders
   ON ode_ord_id = ord_id
   WHERE ord_id = p_numero_commande;
END |

DELIMITER ;


CALL facture();