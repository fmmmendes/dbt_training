#!/bin/sh

dbt run --project-dir=dbt_training --profiles-dir=dbt_profiles --profile=dbt_training

dbt docs generate --project-dir=dbt_training --profiles-dir=dbt_profiles --profile=dbt_training