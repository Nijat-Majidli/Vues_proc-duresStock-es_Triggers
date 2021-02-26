START TRANSACTION;

--
-- Reqûete pour définir la pépiniériste le plus ancien en poste dans ce magasin :
--
SELECT emp_lastname, emp_firstname, emp_enter_date, pos_libelle  
FROM employees 
JOIN posts
ON emp_pos_id = pos_id
WHERE emp_pos_id=14 
ORDER BY emp_enter_date ASC); 

--
-- On ajoute une colonne dans la table posts pour référencer les employés à la retraite:
--
INSERT INTO posts(employé_retraite) VALUES(Amity_HANNAH);

-- 
-- On supprime de la table "employees" Amity HANNAH, Manageuse au sein du magasin d'Arras, qui vient de prendre sa retraite. 
--
DELETE FROM employees WHERE emp_lastname='HANNAH' et emp_firstname='Amity';

-- 
-- On met à jour la table "employees" avec le nouveau manager:
--
UPDATE employees SET emp_pos_id=2 WHERE emp_lastname='SIMONE' et emp_firstname='George';
UPDATE employees SET emp_salary=emp_salary*1.05 WHERE emp_lastname='SIMONE' et emp_firstname='George';


COMMIT;