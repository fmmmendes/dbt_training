#!/bin/sh

dbt test --project-dir=dbt_training --profiles-dir=dbt_profiles --profile=dbt_training
