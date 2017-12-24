FROM mongo:latest
ARG SOURCE_CONFIG_FILE=./config/config.yaml
ARG TARGET_CONFIG_FILE=/db/config/config.yaml
ARG TARGET_LOG_PATH=/db/log
ARG TARGET_DATA_PATH=/db/data
COPY $SOURCE_CONFIG_FILE $TARGET_CONFIG_FILE
ENV CONFIG_FILE=$TARGET_CONFIG_FILE
ENV MONGO_LOG_PATH=$TARGET_LOG_PATH
ENV MONGO_DATA_PATH=$TARGET_DATA_PATH
RUN echo "Creating log directory with mkdir -p ${MONGO_LOG_PATH}"
RUN mkdir -p $MONGO_LOG_PATH
RUN mkdir -p $MONGO_DATA_PATH
RUN echo "running mongod --config=${CONFIG_FILE}" | tee -a
CMD mongod "--config=${CONFIG_FILE}"
