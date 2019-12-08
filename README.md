<h1 align="center">Bienvenue dans BEENT 👋</h1>

> Gestion d'emploi du temps sous Symphony

## Equipe
 - 👤 Baptiste MESSIN 
 - 👤 Nicolas GROSPERRIN 
 - 👤 Souleymane DIALLO
 - 👤 Evan JUGE

## Arborescence
Github {
  `Site : https://github.com/Ayce45/BEENT`
}

MCD {
`JMerise : MCD/BEENT.mcd,`
`Image : MCD/BEENT.jpg`
}

Requête {
  `Fichier : SQL/select.sql`
}

Déclencheurs {
  `Fichier : SQL/trigger.sql`
}

Création de table {
  `Fichier : SQL/create_table.sql`
}

Insertion des données {
  `Fichier : SQL/insert_data.sql`
}

Interface {
  `Adobe XD : INTERFACE/SOURCE/*.xd, Image : INTERFACE/RENDU/*.png`
}

## Outils
 - MCD : JMerise 
 - Requête : phpMyAdmin 
 - Interface : Adobe XD

## Interface
![Interface](https://user-images.githubusercontent.com/32338891/69720804-b95aae00-1113-11ea-827b-029cca20cc23.png)

## MCD
![BEENT](https://user-images.githubusercontent.com/32338891/70323247-9c695d80-182c-11ea-8570-f6fd05b15ad3.png)


## Déclencheurs, requêtes
#### Déclancheurs d'erreur :
 - Si un cours est programmer dans la même salle avec un chevauchement.
 - Si un cours est programmer avec le même groupe avec un chevauchement.
 - Si un cours est programmer avec le même prof avec un chevauchement.
 - Si un cours dépasse le nombre d'heure prévu.
 - Si la capaciter de la salle est inferieure a la sommes des groupes du cours.
 - Si le type du cours est TP et que la salle n'as pas de pc.

#### Requêtes :
 - Afficher les cours de la semaine.
 - Afficher les cours de la semaine par prof.
 - Afficher le nombres d'heures de cours par semaine.
 - Afficher la moyenne d'heures par jours sur la semaine.
 - Afficher le nombre d'heure de TP,TD,CM.
 - Afficher si il y a un CC ou CT cette semaine.
 - Afficher les cours de `type` de la semaine.
 - Afficher les cours en erreur.
