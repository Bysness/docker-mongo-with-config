echo "Creating volumes."

#create volumes
sudo docker volume create --name vol_mongo_repl_alpha0 && \
sudo docker volume create --name vol_mongo_repl_alpha1 && \
sudo docker volume create --name vol_mongo_repl_alpha2 && \
sudo docker volume create --name vol_mongo_repl_beta0 && \
sudo docker volume create --name vol_mongo_repl_beta1 && \
sudo docker volume create --name vol_mongo_repl_beta2

echo "Volumes created."
echo "Building images"
#build mongo images with a config file

#create alpha0 image
mkdir -p ./config/ && cp ./repl_alpha/n0/config.yaml ./config/an0.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/an0.yaml --tag mongo_repl_alpha0 ./
#create alpha1 image
mkdir -p ./config/ && cp ./repl_alpha/n1/config.yaml ./config/an1.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/an1.yaml --tag mongo_repl_alpha1 ./
#create alpha2 image
mkdir -p ./config/ && cp ./repl_alpha/n2/config.yaml ./config/an2.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/an2.yaml --tag mongo_repl_alpha2 ./

echo "Built images 3/6"

#create beta0 image
mkdir -p ./config/ && cp ./repl_beta/n0/config.yaml ./config/bn0.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/bn0.yaml --tag mongo_repl_beta0 ./
#create beta1 image
mkdir -p ./config/ && cp ./repl_beta/n1/config.yaml ./config/bn1.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/bn1.yaml --tag mongo_repl_beta1 ./
#create beta2 image
mkdir -p ./config/ && cp ./repl_beta/n2/config.yaml ./config/bn2.yaml && sudo docker build --build-arg SOURCE_CONFIG_FILE=./config/bn2.yaml --tag mongo_repl_beta2 ./

echo "Built images 6/6"

echo "Starting containers"


#start alpha containers
sudo docker run --network=host --name mongo_repl_alpha0 -d -p 26000:26000 --mount type=volume,source=vol_mongo_repl_alpha0,destination=/db mongo_repl_alpha0 && \
sudo docker run --network=host --name mongo_repl_alpha1 -d -p 26001:26001 --mount type=volume,source=vol_mongo_repl_alpha1,destination=/db mongo_repl_alpha1 && \
sudo docker run --network=host --name mongo_repl_alpha2 -d -p 26002:26002 --mount type=volume,source=vol_mongo_repl_alpha2,destination=/db mongo_repl_alpha2

#start beta containers
sudo docker run --network=host --name mongo_repl_beta0 -d -p 26003:26003 --mount type=volume,source=vol_mongo_repl_beta0,destination=/db mongo_repl_beta0 && \
sudo docker run --network=host --name mongo_repl_beta1 -d -p 26004:26004 --mount type=volume,source=vol_mongo_repl_beta1,destination=/db mongo_repl_beta1 && \
sudo docker run --network=host --name mongo_repl_beta2 -d -p 26005:26005 --mount type=volume,source=vol_mongo_repl_beta2,destination=/db mongo_repl_beta2

echo "Started containers."
echo "Bysness Replicaset Setup Successful!"

