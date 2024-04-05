# Clone the source code repository
git clone https://github.com/dockersamples/example-voting-app.git

# Change directory to example-voting-app/
cd example-voting-app/

# Change directory to vote/
cd vote/

# Go to Dockerfile
cat Dockerfile

# Build the docker image voting-app
docker build . -t voting-app

# Run a container
docker run -p 5000:80 voting-app

# # List all containers
# docker ps -a

# # Remove redis and db
# docker rm db
# docker rm redis

# Start redis
docker run -it --name=redis redis

# Run another instance of voting-app
docker run -p 5000:80 --link redis:redis voting-app

# Deploy a postgres database instance
docker run -it --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:15-alpine 
# docker run -it --name=db -e POSTGRES_PASSWORD=password postgres:15-alpine 

# Change directory to worker
cd example-voting-app/worker/

# Build the docker image for worker
docker build . -t worker-app

# Create a link for worker-app
docker run --link redis:redis --link db:db worker-app

# Change directory to result
cd example-voting-app/result/

# Build the docker image for result-app
docker build . -t result-app

# Run an instance of result-app
docker run -p 5001:80 --link db:db result-app