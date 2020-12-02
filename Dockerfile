FROM python:3.11-alpine
WORKDIR /code

ARG MONGO_USERNAME
ARG MONGO_PASSWORD
ARG MONGO_HOST
ARG MONGO_DATABASE

ENV FLASK_APP=src/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development
ENV APP_SETTINGS=src.config.DevelopmentConfig
ENV MONGO_USERNAME=$MONGO_USERNAME
ENV MONGO_PASSWORD=$MONGO_PASSWORD
ENV MONGO_HOST=$MONGO_HOST
ENV MONGO_DATABASE=$MONGO_DATABASE

RUN apk add --no-cache gcc musl-dev linux-headers bash python3-dev musl-dev
COPY requirements.txt requirements.txt

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb

RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
