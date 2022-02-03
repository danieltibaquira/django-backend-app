FROM python:3.7-alpine
MAINTAINER DANIEL TIBAQUIRA

# Recommended in docker environments 
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN python -m pip install --upgrade pip
RUN pip3 install -r requirements.txt

RUN mkdir /app
# Setting default directory
WORKDIR /app
COPY ./app /app

# -D user that only can run applications
RUN adduser -D user
USER user
