```bash
docker build -t jupyter-notebook -f ./Dockerfile.jupyter .

docker build -t mlflow-tracking-server -f Dockerfile.mlflow . 
```

# Change password for Postgres User

+ Start service with docker compose up
+ SSH into db service (docker compose exec db bash)
+ psql -U <Username>
+ execute `ALTER USER postgres PASSWORD '<new-password>'`;


# Create local certificate for HTTPS/SSL
To use HTTPS over nginx also in local setup

Create private key
+ openssl genrsa -out coffeeshop.key 2048 

Create Certificate
+ openssl req -key coffeeshop.key -new -out coffeeshop.csr

Create signature
+ openssl x509 -signkey coffeeshop.key -in coffeeshop.csr -req -days 365 -out coffeeshop.crt -extfile v3.ext


### Chrome: TODO




