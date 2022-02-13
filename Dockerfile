FROM openjdk:17-jdk-slim

ENV MINECRAFT_VERSION=1.18.1
ENV PAPERMC_BUILD=197

RUN apt-get update && \
  apt-get install -y dumb-init curl && \
  adduser --system --uid 1000 --disabled-password --home /home/minecraft minecraft

WORKDIR /home/minecraft

RUN curl https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${PAPERMC_BUILD}/downloads/paper-${MINECRAFT_VERSION}-${PAPERMC_BUILD}.jar -o paper.jar
RUN java -jar paper.jar && \
    echo "eula=true" > eula.txt

COPY configs/* ./
COPY entrypoint.sh entrypoint.sh
RUN chown minecraft:nogroup -R . && ls -la

USER minecraft
ENV USER=container HOME=/home/minecraft

ENTRYPOINT [ "./entrypoint.sh" ]
