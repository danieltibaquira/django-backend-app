FROM python:3.7-alpine
MAINTAINER DANIEL TIBAQUIRA

# Recommended in docker environments 
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev

RUN python -m pip install --upgrade pip
RUN pip3 install -r requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
# Setting default directory
WORKDIR /app
COPY ./app /app

# -D user that only can run applications
RUN adduser -D user
USER user
