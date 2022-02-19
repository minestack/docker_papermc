#!/bin/bash
set -xe

exec java -Xms${JVM_HEAP} -Xmx${JVM_HEAP} -Dlog4j.configurationFile=log4j2.xml ${JAVA_ARGS} -jar paper.jar --nogui -W worlds --nojline
