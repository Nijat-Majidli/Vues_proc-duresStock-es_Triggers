-- Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente".

DELIMITER |

CREATE PROCEDURE Lst_Rush_Orders(IN p_ord_status VARCHAR(25))

BEGIN
   SELECT * FROM orders
   WHERE ord_status = p_ord_status;
END |

DELIMITER ;

-- Pour exécuter une procédure stockée, il faut procéder à un appel (onglet SQL de PhpMyAdmin) 
-- grâce à l'instruction CALL suivie du nom de la procédure :

CALL Lst_Rush_Orders('commande urgente');


