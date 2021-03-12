#windward-server
Dedicated docker server for Windward

Create a containerized version of Windward Dedicated Server https://store.steampowered.com/app/326410/Windward/

Build by hand 
```
git clone https://github.com/antimodes201/windward-server.git
docker build -t antimodes201/windward-server:latest .
```
 
Docker pull
```
docker pull antimodes201/windward-server
```
 
Docker Run with defaults change the volume options to a directory on your node and maybe use a different name then the one in the example.  
You can now also set the timezone using -e TZ "Your_TIMEZONE"
 
Timezone list can be found at: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
```
docker run -it -p 6012:6012/udp -p 6012:6012/tcp -v /app/docker/temp-vol:/app \
	-e WINDWARD_SERVER_NAME="T3stN3t Sail HO! - Discord" \
	-e WINDWARD_SERVER_WORLD="T3stN3t" \
	-e WINDWARD_SERVER_PORT="6012" \
	--name windward antimodes201/windward-server:latest
```
 

Currently exposed environmental variables and their defaul values 
- TZ America/New_York
- WINDWARD_SERVER_NAME "Containerized Server by T3stN3t"
- WINDWARD_SERVER_WORLD "world"
- WINDWARD_SERVER_IS_PUBLIC "1"
- WINDWARD_SERVER_PORT "5127"