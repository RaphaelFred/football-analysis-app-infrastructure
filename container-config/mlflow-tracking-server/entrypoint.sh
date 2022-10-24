#!/bin/bash
 
echo "MLflow backend store URI: $MLFLOW_TRACKING_URI"
echo "MLflow default artifact root: $ARTIFACT_STORE"
echo "MLflow host: $MLFLOW_SERVER_HOST"
echo "MLflow port: $MLFLOW_SERVER_PORT"
echo "MLflow command: mlflow server --backend-store-uri $MLFLOW_TRACKING_URI --default-artifact-root $ARTIFACT_STORE --host $MLFLOW_SERVER_HOST --port $MLFLOW_SERVER_PORT"
 
if [[ "$MLFLOW_TRACKING_URI" =~ "^postgresql://.*@([^:/]*)(:([0-9]+))?" ]]
then
    HOST=${BASH_REMATCH[1]}
    PORT=${BASH_REMATCH[3]}
 
    echo "Waiting for PostgreSQL..."
 
    while ! nc -z $HOST $PORT; do
        sleep 0.1
    done
 
    echo "PostgreSQL started. Give it 5 seconds to settle down."
    sleep 5.0
fi
 
mlflow server \
    --backend-store-uri $MLFLOW_TRACKING_URI \
    --default-artifact-root $ARTIFACT_STORE \
    --host $MLFLOW_SERVER_HOST \
    --port $MLFLOW_SERVER_PORT