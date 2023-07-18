# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install nginx
# RUN apt-get update -y && apt-get install -y nginx && rm /etc/nginx/sites-enabled/default

# Copy nginx configuration file
# COPY ./project_config/nginx/nginx.conf /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# Install Django and its dependencies
WORKDIR /demo_django_deployment
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 
RUN mkdir -pv /var/log/gunicorn /var/run/gunicorn /var/www/demo_django_deployment/static


CMD [ "-c", "./project_config/dev_config.py" ]

ENTRYPOINT [ "gunicorn" ]

# Copy source code
COPY . .
