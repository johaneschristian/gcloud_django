FROM python:3.8
ENV DockerHome=/home/app/
RUN mkdir -p $DockerHome
WORKDIR $DockerHome

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ARG arg_database_url
ENV DATABASE_URL=$arg_database_url

RUN pip install --upgrade pip
COPY . $DockerHome
RUN pip install -r requirements.txt
RUN python manage.py migrate

ENV DJANGO_SUPERUSER_EMAIL="admin@admin.com"
ENV DJANGO_SUPERUSER_USERNAME = "admin"
ENV DJANGO_SUPERUSER_PASSWORD = "admin"
RUN python manage.py createsuperuser --no-input

EXPOSE 8080
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]
