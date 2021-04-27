#!/usr/bin/env bash
# this is to setup the db
# run on the command line with bash db/migrations/setup_db.sh
# WARNING: deletes existing database, then recreates it.

psql -f ./db/migrations/00_drop_databases.sql
psql -f ./db/migrations/01_create_databases.sql

psql -d airbnb_development -f ./db/migrations/02_create_users_table.sql
psql -d airbnb_development -f ./db/migrations/03_create_spaces_table.sql
psql -d airbnb_test -f ./db/migrations/02_create_users_table.sql
psql -d airbnb_test -f ./db/migrations/03_create_spaces_table.sql
