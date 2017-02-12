#!/usr/bin/env bash
"/Users/victor/Programs/pgsql/bin/pg_dump" \
  --host=localhost \
  --port=2040 \
  --username=lt_admin \
  --dbname=life_tool \
  --schema=test \
  --encoding=UTF8 \
  --schema-only \
  --file="/Users/victor/Source/data_api/db/db.sql"
