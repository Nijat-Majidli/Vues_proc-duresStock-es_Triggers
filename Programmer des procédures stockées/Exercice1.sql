-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs.

DELIMITER |

CREATE PROCEDURE Lst_Suppliers()
BEGIN
    SELECT sup_name FROM suppliers;
END |

DELIMITER ;


-- Pour exécuter une procédure stockée, il faut procéder à un appel (onglet SQL de PhpMyAdmin) 
-- grâce à l'instruction CALL suivie du nom de la procédure :

CALL Lst_Suppliers;





