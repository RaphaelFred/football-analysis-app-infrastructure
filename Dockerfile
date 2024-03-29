FROM python:3.9.7-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y openjdk-11-jre
RUN apt-get update && apt-get install -y jq libpq5 netcat unzip

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt
RUN pip install --no-cache /app/wheels/*
RUN pip install -r requirements.txt
RUN pip install flake8 psycopg2-binary

WORKDIR /app

COPY ./entrypoint.sh /
