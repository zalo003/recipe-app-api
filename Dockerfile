FROM python:3.10-alpine
LABEL Solomon Gbaamosi

# create environment
ENV PYTHONUNBUFFERED 1

# create requirement file
COPY ./requirements.txt /requirements.txt

# install requirements inside docker
RUN pip install -r /requirements.txt

# create an app directory
RUN mkdir /app

# make the app directory the working or default directory
WORKDIR /app

# duplicate the docker to our app
COPY ./app /app

# create a user to run app from docker
RUN adduser -D user

# instantiate user as apprunner prevent image from running application from
# root account
USER user