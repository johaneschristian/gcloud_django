FROM python:3.8
ENV DockerHome=/home/app/
RUN mkdir -p $DockerHome
WORKDIR $DockerHome

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY . $DockerHome
RUN pip install -r requirements.txt
EXPOSE 8080

RUN python manage.py migrate
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]
