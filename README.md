# Projet 8
## Contexte
Conception intégrale d'un outil de gestion d'emploi du temps pour la section L3 MIAGE.

## Equipe
 - 👤 Baptiste MESSIN 
 - 👤 Nicolas GROSPERRIN 
 - 👤 Souleymane DIALLO
 - 👤 Evan JUGE

## Outils
 - MCD : JMerise 
 - Requête : phpMyAdmin 
 - Interface : Adobe XD, HTML
 - Planification : GanttProject

## Arborescence
Github {
  `Site : https://github.com/Ayce45/BEENT`
}

MCD {
`JMerise : MCD/BEENT.mcd,`
`Image MCD : MCD/MCD.png`
`Image MLD : MCD/MLD.png`
}

Requête {
  `Fichier : SQL/select.sql`
}

Déclencheurs {
  `Fichier : SQL/triggers.sql`
}

Création de table {
  `Fichier : SQL/create_table.sql`
}

Insertion des données {
  `Fichier : SQL/insert_data.sql`
}

Interface {
  `Image : INTERFACE/*.png`
}

Planification {
  `Fichier : GANTT/BEENT.gan, Image : GANTT/*.png`
}

## Interface
### Frontoffice
![Fontoffice](https://user-images.githubusercontent.com/32338891/71740679-2e30ae80-2e5d-11ea-9696-a5967ba4fd61.png)
### Backoffice
![Backoffice](https://user-images.githubusercontent.com/32338891/71810628-16cb0e80-3073-11ea-8542-0df0c0a09397.png)

`Voir plus dans INTERFACE`

## MCD
![MCD](https://user-images.githubusercontent.com/32338891/70323247-9c695d80-182c-11ea-8570-f6fd05b15ad3.png)

`Voir plus dans MCD`

## Planification
![Gantt](https://user-images.githubusercontent.com/32338891/71810456-ba67ef00-3072-11ea-93c8-5b616f2414a5.png)
![Tache](https://user-images.githubusercontent.com/32338891/71810446-b3d97780-3072-11ea-8e8d-92949cc9c96a.png)

`Voir plus dans GANTT`

## Déclencheurs, requêtes
#### Déclancheurs d'erreur :
 - Si un cours est programmer dans la même salle avec un chevauchement.
 - Si un cours est programmer avec le même groupe avec un chevauchement.
 - Si un cours est programmer avec le même prof avec un chevauchement.
 - Si un cours dépasse le nombre d'heure prévu.
 - Si la capaciter de la salle est inferieure a la sommes des groupes du cours.
 - Si le type du cours est TP et que la salle n'as pas de pc.
 
 `Voir le SQL dans SQL/triggers.sql`

#### Requêtes :
 - Afficher les cours de la semaine.
 - Afficher les cours de la semaine par prof.
 - Afficher le nombres d'heures de cours par semaine.
 - Afficher la moyenne d'heures par jours sur la semaine.
 - Afficher le nombre d'heure de TP,TD,CM.
 - Afficher si il y a un CC ou CT cette semaine.
 - Afficher les cours de `type` de la semaine.
 
  `Voir le SQL dans SQL/select.sql`