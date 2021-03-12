FROM mono:6.12.0.107

# Set some Variables
ENV TZ "America/New_York"
ENV WINDWARD_SERVER_NAME "Containerized Server by T3stN3t"
ENV WINDWARD_SERVER_WORLD "world"
ENV WINDWARD_SERVER_IS_PUBLIC "1"
ENV WINDWARD_SERVER_PORT "5127"


# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
		lib32gcc1 \
		wget \
		unzip \
		tzdata \
		ca-certificates 

# add steamuser user
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /app \
		&& mkdir -p /scripts \
        && chown steamuser:steamuser /app \
		&& chown steamuser:steamuser /scripts 
		
ADD start.sh /scripts/start.sh

USER steamuser

# Make a volume
# contains configs and world saves
VOLUME /app

CMD ["/scripts/start.sh"]
