#!/bin/sh

echo "Connenction to postgres server..."

while ! nc -z $SQL_DB_HOST $SQL_DB_PORT; do
    # echo $(nc -zv $SQL_DB_HOST $SQL_DB_PORT)
    sleep 0.1
done

echo "Postges connection SUCCESS!"

python ./musicapp/manage.py makemigrations
python ./musicapp/manage.py migrate
python ./musicapp/manage.py collectstatic

exec "$@"