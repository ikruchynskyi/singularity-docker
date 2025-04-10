1. Clone your github keys to ssh directory
2. Build the image 
```
docker compose build --no-cache app
```
3. Run continer to pull repository
```
docker-compose run --rm app bash
```
