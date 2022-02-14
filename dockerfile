from PYTHON:3.8.5-alpine

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./FOOTBALL_ANALYSIS_APP /app

WORKDIR /app