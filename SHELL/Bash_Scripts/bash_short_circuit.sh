#!/usr/bin/env bash

LOG_FILE=/var/log/hiveapi/hiveapi_error.log
ACCESS_LOG=/var/log/hiveapi/hiveapi_access.log
PORT=80
DEPLOYMENT=production

already_running=$(ps aux | grep 'HiveAPI/bin/app.psgi' | awk '/perl/{ print $11 }' | xargs)

# FORMAT: { do this } || { if that fails, do this }

# Start if not already running
{ [[ "${already_running,,}" =~ perl ]] && echo "Hive API Running" ; } || { echo "Not running. Starting Up on port ${PORT}...." && $(sudo plackup -p ${PORT} --env ${DEPLOYMENT} -r  /home/control-io/www/HiveAPI/bin/app.psgi --access-log ${ACCESS_LOG} & ) & }
