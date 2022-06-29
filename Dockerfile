# parent image
FROM python:3.7.7-stretch

#create directory, copy files and set working directory
RUN mkdir /app
COPY . /app
WORKDIR /app

#install and update packages
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip install --upgrade pip
RUN pip uninstall jwt
RUN pip install -r requirements_container.txt

#start the server
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
