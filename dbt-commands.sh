#!/bin/sh

# activate virtal env for dbt
source .dbt-env/bin/activate

# Load environment variables
source .env

# print environment variables
echo $PROJECT_DIR
echo $PROFILES_DIR
echo $PROFILE

# Execute dbt command
COMMAND_ARG=$1
echo "execute dbt: $COMMAND_ARG"

if [ "${COMMAND_ARG}" = "clean" ]; then

echo "execute dbt clean"
dbt clean --project-dir=$PROJECT_DIR --profiles-dir=$PROFILES_DIR --profile=$PROFILE


elif [ "${COMMAND_ARG}" = "test" ]; then

echo "execute dbt test"
dbt test --project-dir=$PROJECT_DIR --profiles-dir=$PROFILES_DIR --profile=$PROFILE

elif [ "${COMMAND_ARG}" = "run" ]; then

dbt run --project-dir=$PROJECT_DIR --profiles-dir=$PROFILES_DIR --profile=$PROFILE


elif [ "${COMMAND_ARG}" = "docs" ]; then

echo "execute dbt docs"
dbt docs generate --project-dir=$PROJECT_DIR --profiles-dir=$PROFILES_DIR --profile=$PROFILE

else

echo "input argument is not valid"
echo "execute bash dbt-commands.sh [clean|test|run|docs]"
echo "for more information, please visit https://docs.getdbt.com/reference/commands"
echo "or type dbt --help"

fi


