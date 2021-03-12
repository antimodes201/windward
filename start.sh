#!/bin/bash

SERVER_REMOTE_FILE=http://www.tasharen.com/windward/WWServer.zip
SERVER_TEMP_FILE=/app/WWServer-tmp.zip
SERVER_LOCAL_FILE=/app/WWServer.zip

echo "Downloading latest dedicated server"

curl -s -o ${SERVER_TEMP_FILE} ${SERVER_REMOTE_FILE}

if [ -f ${SERVER_LOCAL_FILE} ]; then
	echo "Checking local dedicated server is the latest version..."
	SERVER_LOCAL_MD5=`md5sum ${SERVER_LOCAL_FILE} | cut -d' ' -f1`
	SERVER_TEMP_MD5=`md5sum ${SERVER_TEMP_FILE} | cut -d' ' -f1`
	if ! [ "${SERVER_LOCAL_MD5}" = "${SERVER_TEMP_MD5}" ]; then
	
		echo "Newer version available - Upgrading"
		mv -f ${SERVER_TEMP_FILE} ${SERVER_LOCAL_FILE}
		unzip ${SERVER_LOCAL_FILE} -d /app/

	fi

else

	echo "Newer version available - Upgrading"
	mv ${SERVER_TEMP_FILE} ${SERVER_LOCAL_FILE}
	unzip ${SERVER_LOCAL_FILE} -d /app/
fi

if [ "${WINDWARD_SERVER_PUBLIC}" = "1" ]; then
	WINDWARD_SERVER_IS_PUBLIC="-public"
fi

# Move save directory
#mkdir -p /home/steamuser/Windward

if [ ! -d /app/saves ]
then
	mkdir /app/saves
fi
ln -s /app/saves /home/steamuser/Windward


cd /app

mono WWServer.exe -service -name "${WINDWARD_SERVER_NAME}" -world "${WINDWARD_SERVER_WORLD}" ${WINDWARD_SERVER_IS_PUBLIC} -tcp ${WINDWARD_SERVER_PORT} -http

