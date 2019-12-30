#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

#Trigger empechant deux cours différents dans la même salle
CREATE TRIGGER `SalleOccupe` BEFORE INSERT ON `Cours`
 FOR EACH ROW 
BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Salle = new.id_Salle;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
             	LEAVE read_loop;
        END IF;
   
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20000' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20001' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
    
    if new.debut<=debutT  and new.fin>=finT then
           signal sqlstate '20002' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
     
END

#Trigger empechant un groupe d'avoir 2 cours en même temps
CREATE TRIGGER 'groupeOccupe' BEFORE INSERT ON 'Cours'
  for each row
BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Groupe = new.id_Groupe;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
            	LEAVE read_loop;
        END IF;
   
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20001' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20002' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
    
    if new.fin<=debutT  and new.fin>=finT then
           signal sqlstate '20003' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
     
END

#Trigger empechant un prof de travailler sur plusieurs cours à la fois
CREATE TRIGGER 'profOccupe' BEFORE INSERT ON 'Cours'
  for each row
BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Enseignant = new.id_Enseignant;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
             	LEAVE read_loop;
        END IF;
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20001' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20002' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
    
    if new.fin<=debutT  and new.fin>=finT then
           signal sqlstate '20003' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
     
END

#Trigger empechant un groupe à aller dans une salle trop petite par rapport au nombre de personne de ce groupe
CREATE TRIGGER 'capaciteSalle' BEFORE INSERT ON 'Cours'
  for each row
BEGIN
DECLARE capaciteSalle INTEGER;
DECLARE capaciteGroupe INTEGER;
	select capacite into capaciteSalle from Salle where id = new.id_Salle;
	select capacite into capaciteGroupe from Groupe where id=new.id_Groupe;
	if capaciteSalle<capaciteGroupe then
		signal sqlstate '20010' set message_text = 'Salle trop petite pour la taille du groupe';
	end if;
End

#Trigger empechant un TP dans un salle n'ayant pas de pc

CREATE TRIGGER 'coursTP' BEFORE INSERT ON 'Cours'
  for each row
BEGIN
DECLARE libelleType VARCHAR(2);
DECLARE pcSalle INTEGER;
	select libelle into libelleType from Type WHERE id = new.id_Type ;
	select pc into pcSalle from Salle where id = new.id_Salle;
	if (pcSalle=0 and libelleType = 'TP') then
		signal sqlstate '20011' set message_text = 'Salle non adapté pour un TP' ;
	end if;
END
