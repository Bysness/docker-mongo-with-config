FROM mongo:latest
ARG SOURCE_CONFIG_FILE=./config/config.yaml
ARG TARGET_CONFIG_FILE=/db/config/config.yaml
COPY $SOURCE_CONFIG_FILE $TARGET_CONFIG_FILE
RUN echo "running mongod --config=${TARGET_CONFIG_FILE}"
CMD mongod '--config=${TARGET_CONFIG_FILE}'
