#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

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

create or replace
trigger coursTP
  BEFORE INSERT
  ON Cours
  for each row
Declare
	libelleType varchar2;
	pcSalle boolean;
BEGIN
	select Type.libelle into libelleType from Type, Matiere, Matiere_Semestre where Matiere.id = Matiere_Semestre.id and Matiere_Semestre.id_Type = Type.id and Matiere.id = :new.id_Matiere ;
	select pc into pcSalle from Salle where id = :new.id_Salle;
	if (not pcSalle and libelleType = 'TP') then
		RAISE_APPLICATION_ERROR ( -20006, 'Salle non adapté pour un TP') ;
	end if;
End;
/
