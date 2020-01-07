#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

#Afficher les cours de la semaine.
SELECT t.libelle as type
       , m.libelle as matiere
       , s.code as salle
       , CONCAT('Gr ', g.code) as groupe
       , CONCAT(e.prenom,' ',e.nom) as enseignant
       , c.debut as debut
       , c.fin as fin 
FROM COURS c 
JOIN MATIERE m ON (c.id_matiere = m.id) 
JOIN SALLE s ON (c.id_salle = s.id) 
JOIN GROUPE g ON (c.id_groupe = g.id) 
JOIN ENSEIGNANT e ON (c.id_enseignant = e.id) 
JOIN TYPE t ON (c.id_type = t.id) 
WHERE WEEK(c.debut) = WEEK(SYSDATE());
                       
#Afficher les cours de la semaine par prof.
SELECT t.libelle as type
       , m.libelle as matiere
       , s.code as salle, CONCAT('Gr ', g.code) as groupe
       , CONCAT(e.prenom,' ',e.nom) as enseignant
       , c.debut as debut
       , c.fin as fin FROM COURS c 
JOIN MATIERE m ON (c.id_matiere = m.id) 
JOIN SALLE s ON (c.id_salle = s.id) 
JOIN GROUPE g ON (c.id_groupe = g.id) 
JOIN ENSEIGNANT e ON (c.id_enseignant = e.id) 
JOIN TYPE t ON (c.id_type = t.id) 
WHERE WEEK(c.debut) = WEEK(SYSDATE()) 
AND e.nom = 'JUGE';
                           
#Afficher le nombres d'heures de cours de la semaine.
SELECT avg(HOUR(c.fin) - HOUR(c.debut)) 
FROM COURS c
WHERE WEEK(c.debut) = WEEK(SYSDATE());

#Afficher la moyenne d'heures par jours sur la semaine.
SELECT avg(HOUR(c.fin) - HOUR(c.debut)), DAYNAME(c.fin) 
FROM COURS c
WHERE WEEK(c.debut) = WEEK(SYSDATE())
GROUP BY DAYNAME(c.fin)
                           
#Afficher le nombre d'heure de TP,TD,CM de cette semaine.
SELECT SUM(HOUR(c.fin) - HOUR(c.debut)), t.libelle
FROM COURS c
JOIN TYPE t ON (t.id = c.id_Type)
WHERE WEEK(c.debut) = WEEK(SYSDATE())
GROUP BY t.id
                           
#Afficher si il y a un CC ou CT cette semaine.
SELECT t.libelle as type
       , m.libelle as matiere
       , s.code as salle, CONCAT('Gr ', g.code) as groupe
       , CONCAT(e.prenom,' ',e.nom) as enseignant
       , c.debut as debut
       , c.fin as fin FROM COURS c 
JOIN MATIERE m ON (c.id_matiere = m.id) 
JOIN SALLE s ON (c.id_salle = s.id) 
JOIN GROUPE g ON (c.id_groupe = g.id) 
JOIN ENSEIGNANT e ON (c.id_enseignant = e.id) 
JOIN TYPE t ON (c.id_type = t.id)
WHERE WEEK(c.debut) = WEEK(SYSDATE())
AND (t.libelle = 'CT' OR t.libelle = 'CC')
                           
#Afficher les cours de type de la semaine.
SELECT t.libelle as type
       , m.libelle as matiere
       , s.code as salle, CONCAT('Gr ', g.code) as groupe
       , CONCAT(e.prenom,' ',e.nom) as enseignant
       , c.debut as debut
       , c.fin as fin FROM COURS c 
JOIN MATIERE m ON (c.id_matiere = m.id) 
JOIN SALLE s ON (c.id_salle = s.id) 
JOIN GROUPE g ON (c.id_groupe = g.id) 
JOIN ENSEIGNANT e ON (c.id_enseignant = e.id) 
JOIN TYPE t ON (c.id_type = t.id) 
WHERE WEEK(c.debut) = WEEK(SYSDATE())
AND t.libelle = 'CM'
