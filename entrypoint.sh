#!/bin/bash

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

gunicorn football_analysis_app.wsgi:application --bind 0.0.0.0:8000
