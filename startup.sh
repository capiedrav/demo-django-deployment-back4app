nginx # start nginx server (in the background)
gunicorn -c project_config/dev_config.py # start gunicorn server in the foreground 