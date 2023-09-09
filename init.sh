#!/bin/sh



# build
docker-compose -f docker-compose-dbt-db.yml build

# run
docker-compose -f docker-compose-dbt-db.yml up -d

sleep 5

# create virual env
python3 -m venv .dbt-env

# install python packages
pip3 install -r requirements.txt

# dbt run all
bash dbt-run-all.sh
