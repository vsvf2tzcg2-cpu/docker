# Exercice — Réutiliser un volume nommé avec plusieurs serveurs web

## Objectif

Mettre en pratique les **volumes nommés Docker** en déployant un même site statique successivement avec **Nginx**, **Apache HTTP Server** puis **Caddy**.

Le site statique sera fourni sous la forme d'une **archive ZIP**.

Le même volume nommé devra être conservé pendant tout l'exercice.

---

## Étape 1 — Nginx

### 1. Créer le volume et le conteneur

Créez un volume nommé :
# docker volume create static-site
```text
static-site
```

Créez ensuite un conteneur **Nginx** utilisant ce volume pour stocker les fichiers du site.
# docker run -d --name tata -p 8080:80 -v static-site:/usr/share/nginx/html/ nginx

### 2. Ajouter le site dans le volume

Décompressez l'archive ZIP fournie sur votre machine.

Copier les fichiers du site dans le conteneur Nginx, directement dans le répertoire associé au volume `static-site`.
# docker cp C:\Users\Administrateur\Desktop\docker\html5up-editorial-m2i\html5up-editorial\. tata:/usr/share/nginx/html/

Vérifiez que le site est accessible depuis votre navigateur.

### 3. Supprimer Nginx

Arrêtez puis supprimez complètement le conteneur Nginx.
# docket stop tata , docker rm tata

Le volume `static-site` ne doit pas être supprimé.

Vérifiez que le volume existe toujours après la suppression du conteneur.
# docker colume ls 

---

## Étape 2 — Apache HTTP Server

### 1. Créer le conteneur Apache

Créez un nouveau conteneur utilisant l'image **Apache HTTP Server (`httpd`)**.
    # docker run -d --name tutu -p 8080:80 -v static-site:/usr/local/apache2/htdocs/ httpd
Réutilisez le volume :

```text
static-site
```

et montez-le dans le répertoire utilisé par Apache pour servir les fichiers web.

### 2. Vérifier le site

Démarrez le conteneur et vérifiez que le site est accessible depuis votre navigateur.

Vous ne devez **pas recopier les fichiers du site**.

Apache doit directement utiliser les fichiers déjà présents dans le volume.

### 3. Supprimer Apache

Arrêtez puis supprimez complètement le conteneur Apache.
#  docker stop tutu && docker rm tutu
Conservez une nouvelle fois le volume `static-site`.

Vérifiez que le volume existe toujours.
# docker volume ls
---

## Étape 3 — Caddy

### 1. Créer le conteneur Caddy

Créez un nouveau conteneur utilisant l'image **Caddy**.
# docker run -d --name tutu -p 8080:80 -v static-site:/usr/share/caddy/ caddy

Réutilisez encore une fois le volume :

```text
static-site
```

et configurez Caddy afin qu'il serve les fichiers présents dans ce volume.

### 2. Vérifier le site

Démarrez le conteneur Caddy et vérifiez que le même site est toujours accessible depuis votre navigateur.

Aucune nouvelle copie du site ne doit être effectuée.

 