

FROM python:3.7-alpine
WORKDIR /code

ARG INFLUXDB_USERNAME
ARG INFLUXDB_PASSWORD
ARG DATABASE_URL

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development
ENV DATABASE_URL=$DATABASE_URL
ENV APP_SETTINGS=config.DevelopmentConfig
ENV INFLUXDB_USERNAME=$INFLUXDB_USERNAME
ENV INFLUXDB_PASSWORD=$INFLUXDB_PASSWORD


RUN apk add --no-cache gcc musl-dev linux-headers bash
COPY requirements.txt requirements.txt
RUN apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
