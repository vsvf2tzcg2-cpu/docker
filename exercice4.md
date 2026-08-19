# Exercice

## Partie 1

- En utilisant votre machine Windows, lancez le service Docker, s’il n’est pas lancé.

- Créer une image Docker sur votre machine du jeu 2048 (voir screen jeux_2048).
    # docker pull jgreat/2048 
- Vérifier que l’image est bien présente sur votre machine.
    # docker images
- Lancer ce jeu sur un port disponible au travers d’un conteneur que vous allez appeler «jeu-votre-nom ». 
    # docker run -itd -p 8080:80 --name jeu-nathaniel
- Vérifier que le conteneur est bien lancé avec la commande adaptée.
    # docker ps
- Créer un second conteneur qui va lancer le même jeu mais avec un nom différent «jeu2-votre-nom ».
    # docker run -itd -p 8081:80 --name jeu2-nathaniel
- Les 2 jeux sont fonctionnels en même temps sur votre machine, effectuez la commande pour vérifier la présence des conteneurs.
    # docker ps
- Ouvrez les 2 jeux sur votre navigateur. 
- Stopper les 2 conteneurs et assurez-vous que ces 2 conteneurs sont arrêtés.
    # docker stop jeu-nathaniel && docker stop jeu2-nathaniel
- Relancez le conteneur «jeu2-votre-nom » et aller vérifier dans votre navigateur s’il fonctionne bien. Effectuez la commande pour voir s’il a bien été relancé. Puis stopper le. 
    # docker start -it jeu2-nathaniel
    # docker ps
    # docker stop jeu2-nathaniel
- Supprimez l’image du jeu 2048 et les conteneurs associés.
    docker rmi -f jgreat/2048
- Vérifiez que les suppressions ont bien été faite.
# docker images
# docker ps -a

## Partie 2


- Récupérer une image docker nginx.
    # docker pull nginx
- Créer un conteneur en vous basant sur cette image en lui attribuant le nom suivant : « nginx-web».
- Assurez-vous que l’image est bien présente et que le conteneur est bien lancé.
- Ce serveur nginx web (nginx-web) devra être lancé sur un port disponible.
    # docker run -itd -p 8080:80 --name nginx-web nginx
    # docker ps && docker images
- Vérifier que le serveur est bien lancé au travers du navigateur.
- Une page web avec «Welcome to nignx » devrait s'afficher (voir nginx.png). 
- Effectuer la commande vous permettant de rentrer à l’intérieur de votre serveur nginx.
    # docker exec -it nginx-web bash
- Une fois à l’intérieur, aller modifier la page html par défaut de votre serveur nginx en changeant le titre de la page en:
Welcome «votre prenom ».
    # nano usr/share/nginx/html/index.html
- Relancez votre serveur et assurez-vous que le changement à bien été pris en compte, en relançant votre navigateur.
- Refaite la même opération mais en utilisant le serveur web apache et donc il faudra créer un autre conteneur.
 # docker run -it -p 8083:80 --name apache-web apache/airflow
- Il faut supprimer le contenu complet de l'index.html et y mettre : "Je suis heureux et je m'appelle votre prenom".
 # 
- Le changement doit appaître dans votre navigateur.

## Partie 3


- Répétez 3 fois la même opération que pour le début de la partie 2, il faudra juste appelez vos conteneurs :

- « nginx-web3 ».

- « nginx-web4 ».

- « nginx-web5 ».

- Il faudra faire en sorte que les pages html présente dans les fichiers ci-dessous s’affiche dans chacun des navigateurs en lien avec vos conteneurs :

- html5up-editorial-m2i.zip pour nginx-web3

- html5up-massively.zip pour nginx-web4

- html5up-paradigm-shift.zip pour nginx-web5

- Stopper, ensuite, ces différents conteneurs.
