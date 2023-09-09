#!/bin/sh

# Load environment variables
source .env

bash dbt-commands.sh clean

bash dbt-commands.sh test

bash dbt-commands.sh run

bash dbt-commands.sh docs