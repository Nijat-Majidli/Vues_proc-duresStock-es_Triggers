-- Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et une année entrée en paramètre, 
-- calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.
-- On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table suppliers.

DELIMITER |

DROP PROCEDURE IF EXISTS CA_Supplier |

CREATE PROCEDURE CA_Supplier(p_sup_id INT(10), p_order_year INT(4))

BEGIN

  -- D'abord on déclare et initialise une variable p_sup_id_existe afin de vérifier si le fournisseur existe en base de données ou non
  
  DECLARE p_sup_id_existe INT(10); 
  SET p_sup_id_existe = (SELECT sup_id FROM suppliers WHERE sup_id = p_sup_id);
  
  IF NOT ISNULL(p_sup_id_existe) 
   THEN
     SELECT sup_name as fournisseur, SUM(ode.ode_unit_price * ode.ode_quantity) as CA, YEAR(ord.ord_order_date) as année
     FROM orders_details as ode
     JOIN orders as ord 
     ON ord.ord_id = ode.ode_ord_id
     JOIN products 
     ON  products.pro_id = ode.ode_pro_id
     JOIN suppliers
     ON products.pro_sup_id = suppliers.sup_id
     WHERE suppliers.sup_id = p_sup_id AND YEAR(ord.ord_order_date) = p_order_year;

   ELSE           
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le fournisseur n\'existe pas';
   END IF;
END |

DELIMITER ;


CALL CA_Supplier(1, 2008);