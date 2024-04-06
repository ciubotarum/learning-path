# Create a docker compose file
cat > docker-compose.yml
redis:

db

vote:

worker:

result:

# Edit the dockerfile (bash)
vi docker-compose.yml
# pres enter and write this:
redis:
    image: redis

db: 
    image: postgres:15-alpine

vote:
    image: voting-app
    ports: 
        - 5000:80
    links:
        - redis

worker:
    image: worker-app
    links:
        - db
        - redis


result:
    image: result-app
    ports:
        - 5001:80
    links:
        - db

# Running the up command
docker-compose -f docker-compose.yml up
docker-compose -f docker/docker-compose.yml up

docker-compose down