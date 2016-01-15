Pour installer le projet
bundle install
rake db:migrate
rake db:setup

Le fichier seeds.rb peuplera la base.
Pour vous identifiez vous pouvez utiliser l'utilisateur user dont les informations d'authentifications sont:
email: 'user@user.fr'
password: "motdepasse"

Une pagination a été faite pour l'index des posts, elle fonctionne en ajax (ou sans si l'utilisateur a désactivé le javascript) 
et on peut choisir le nombre de résultat par page.

Pour poster un article il faut être inscrit et connecté.
Pour le modifier et le supprimer il faut en être l'auteur.

Les commentaires ont été ajoutés. Il n'y a pas de show ni d'index pour les commentaires car ils sont affichés dans le show d'un post et peuvent y être supprimé ou modifié ( seulement par l'auteur ).