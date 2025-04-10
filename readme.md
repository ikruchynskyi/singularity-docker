1. Create 'ssh' directory and copy your github keys to it
2. Build the image 
```
docker compose build --no-cache app
```
3. Run continer to pull repository
```
docker-compose run --rm app bash
```
