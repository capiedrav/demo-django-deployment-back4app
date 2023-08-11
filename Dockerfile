# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install some postgresql dependencies necessary for psycopg2 package
# RUN apk add --no-cache  postgresql-libs

# Install Django and its dependencies
WORKDIR /demo_django_deployment
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 
RUN mkdir -pv /var/log/gunicorn /var/run/gunicorn /var/www/demo_django_deployment/static


CMD [ "-c", "./project_config/dev_config.py" ]

ENTRYPOINT [ "gunicorn" ]

# Copy source code
COPY . .
