## Projet : Gestion de Planning de Salle de Sport (TP PHP / PDO)

**Objectif :** Concevoir le back-end d’une application web permettant à une salle de sport de gérer la planification, la réservation et le suivi des séances sportives collectives, selon les rôles des utilisateurs (client, coach, gestionnaire).

**Description :** Ce projet consiste à développer une base de données relationnelle et une série de scripts PHP pour gérer :

- L'inscription et la connexion des utilisateurs,

- la consultation du planning des séances sportives,

- la réservation et l’annulation de séances,

- La création et la suppression de séances selon les rôles autorisés.

- L’accent est mis sur la sécurisation de l’accès aux données via PDO, la gestion des rôles, et la structuration claire du code.

**Tâches**
1. **Conception de la base de données :** Modélisez les entités principales : users, activities, sessions, bookings. Les relations sont les suivantes :

- Un utilisateur peut réserver plusieurs séances.

- Un coach peut créer plusieurs séances.

- Une activité peut être proposée dans plusieurs séances.

2. **DDL :** Création de la base de données sport_planning_db avec les tables :

- Users : id (PK, AI), email (UNIQUE, NOT NULL), password_hash (NOT NULL), prenom, nom, role (ENUM: client, coach, gestionnaire), created_at (TIMESTAMP)

- aActivities : id (PK, AI), label (NOT NULL), description (optionnel)

- Sessions : id (PK, AI), activity_id (FK), coach_id (FK), datetime NOT NULL capacity (INT, NOT NULL, CHECK > 0), created_at (TIMESTAMP)

- Bookings : id (PK, AI), user_id (FK), session_id (FK), created_at (TIMESTAMP)

3. **Contraintes :**
- Un utilisateur ne peut pas réserver deux fois la même séance.

- Une séance ne peut pas être sur-réservée.

- Une réservation ne peut pas être annulée à moins de 24h de la séance.

**Insertion de Données (DML) :**

- 3 coachs, 5 clients, 3 activités, 6 séances futures

- Réservations associées à différentes séances

- Requêtes Complexes (DML) à implémenter :

- Afficher toutes les séances à venir avec activité, coach, nombre de places restantes

- Réserver une séance si disponibilité

- Annuler une réservation (si > 24h avant la séance)

- Créer une séance (coach)

- Voir les participants (coach)

- Supprimer une séance (gestionnaire) et notifier les inscrits

**PHP (PDO) :**

**Développez les scripts PHP avec séparation logique par entité :**
- User.php : inscription, connexion, rôle

- Session.php : consultation, création, suppression

- Booking.php : réservation, annulation, affichage

- config.php : paramètres PDO avec try/catch

- routes/ : endpoints API par fonctionnalité

**Fonctionnalités à Implémenter :**
- Inscription utilisateur (US1)

- Connexion (US2)

- Voir le planning (US3)

- Réserver une séance (US4)

- Annuler une réservation (US5)

Fonctionnalités avancées recommandées :
- Créer une séance (coach) (US6)

- Voir les participants (coach) (US7)

- Afficher toutes les séances (gestionnaire) (US8)


##  Conseils & Pistes de Réalisation
1. Commencez par la base de données : créez et testez vos tables avec des données réalistes

2. Utilisez PDO avec des requêtes préparées pour toute interaction avec MySQL

3. Structurez votre code en séparant les fichiers selon leur rôle (entité, configuration, logique métier)

4. Utilisez password_hash() et password_verify() pour sécuriser les mots de passe

5. Gérez les rôles utilisateurs dès la connexion (session PHP ou jeton d’identification)

6. Ajoutez des vérifications métier : capacité de séance, délai d’annulation, unicité de réservation

**Livrables attendus :**
- README.md (ce fichier)

**Script database.sql :**

- Création des tables + jeu de données (activités, utilisateurs, séances)

**Code PHP :**

- Fichiers organisés par entité

- Requêtes SQL bien commentées

- config.php pour la connexion PDO

- Technologies PHP 7.4+

- MySQL

- PDO (obligatoire)

- Requêtes préparées

- password_hash() / password_verify() pour la sécurité

## Conclusion
Ce projet vous permet de pratiquer la modélisation, la programmation PHP orientée objet, et l’accès aux données avec PDO dans un contexte réaliste avec rôles utilisateurs. Il met l’accent sur la sécurité, la séparation des responsabilités, et le respect de la logique métier.

Prenez le temps de tester chaque fonctionnalité, commentez votre code et assurez une bonne structure. C’est un excellent exercice pour préparer des projets web plus complexes ou professionnels.

