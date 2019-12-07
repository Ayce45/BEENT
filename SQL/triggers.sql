#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

CREATE TRIGGER `SalleOccupe` BEFORE INSERT ON `Cours`
 FOR EACH ROW BEGIN
DECLARE debut DATETIME;
DECLARE fin DATETIME;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Salle = new.id_Salle;
   OPEN C1;
   FETCH C1 INTO debut,fin;
	if new.debut>=debut  and new.debut<fin then
           signal sqlstate '20000' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
     CLOSE C1;
End

create or replace
trigger groupeOccupe
  BEFORE INSERT
  ON Cours
  for each row
DECLARE
CURSOR C1 IS SELECT * FROM Cours where id_Groupe = :new.id_Groupe;
BEGIN
  FOR item in C1 LOOP
	if :new.debut>=item.debut  and :new.debut<item.fin then
		RAISE_APPLICATION_ERROR ( -20002, 'Groupe déjà programmé sur un autre cours') ;
	end if;
  END LOOP;
End;
/

create or replace
trigger profOccupe
  BEFORE INSERT
  ON Cours
  for each row
DECLARE
CURSOR C1 IS SELECT * FROM Cours where id_Enseignant = :new.id_Enseignant;
BEGIN
  FOR item in C1 LOOP
	if :new.debut>=item.debut  and :new.debut<item.fin then
		RAISE_APPLICATION_ERROR ( -20003, 'Enseignant déjà programmé sur un autre cours') ;
	end if;
  END LOOP;
End;
/

create or replace
trigger capaciteSalle
  BEFORE INSERT
  ON Cours
  for each row
Declare
	capaciteSalle number;
	capaciteGroupe number;
BEGIN
	select capacite into capaciteSalle from Salle where id = :new.id_Salle;
	select capacite into capaciteGroupe from Groupe where id = :new.id_Groupe;
	if capaciteSalle<capaciteGroupe then
		RAISE_APPLICATION_ERROR ( -20005, 'Salle trop petite pour la taille du groupe') ;
	end if;
End;
/

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
