FROM eclipse-temurin:21-jdk


LABEL version="1.4.1"
LABEL homepage.group="Minecraft"
LABEL homepage.name="FTB Skies 2"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/49/4951517d1bd2376e48d280427f95fd313c7aa778bddff582296651cfae7d7a9a.png"
LABEL homepage.widget.type="minecraft"
LABEL homepage.widget.url="udp://FTBSkies:25565"

# Install dependencies and create user
RUN apt-get update && apt-get install -y curl && \
    adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

# Copy and configure the launch script
COPY launch.sh /launch.sh
RUN chmod +x /launch.sh && \
    chown minecraft:minecraft /launch.sh

# Set the user and working directory
USER minecraft
VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Skies 2 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]
