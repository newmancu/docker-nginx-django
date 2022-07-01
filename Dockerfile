FROM python:3.8
WORKDIR /usr/src/web

RUN apt-get update && apt-get install netcat -y

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY ./requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

RUN mkdir /usr/src/web/staticfiles/ && mkdir /var/log/gunicorn

COPY ./entrypoint.dev.sh .
ENTRYPOINT [ "./entrypoint.dev.sh" ]