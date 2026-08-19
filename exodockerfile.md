dockerfile personalise avec site web base sur l'image de ton choix
```bash
# je lance un docker ps pour verifier les port disponible 
docker ps -a
# je cree mon image a partire de mon dockerfile
docker build -t mon-image
#je cree un conteneur avec mon image
docker run -itd --name monserveur -p 8080:80 mon-image
```