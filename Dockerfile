FROM python:stretch

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]