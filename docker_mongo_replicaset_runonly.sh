
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

