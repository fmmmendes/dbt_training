#!/bin/sh



# build
echo "docker-compose build"
docker-compose -f docker-compose-dbt-db.yml build

# run
echo "docker-compose up (detached)"
docker-compose -f docker-compose-dbt-db.yml up -d

echo "wait 5 seconds"
sleep 5

# create virual env
echo "create virtual env"
python3 -m venv .dbt-env

# install python packages
echo "install python packages"
pip3 install -r requirements.txt

# dbt run all
echo "dbt run all"
bash dbt-run-all.sh
