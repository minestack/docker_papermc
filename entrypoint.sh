#!/usr/bin/dumb-init /bin/bash

java -Xms2G -Xmx2G -Dlog4j.configurationFile=log4j2.xml -jar paper.jar --nogui -W worlds --nojline
