FROM azul/zulu-openjdk-alpine:latest
LABEL maintainer="Artem DevOps"
RUN \
    addgroup -S -g 1000 firsart && \
    adduser -S -u 1000 -G firsart firsart
RUN \ 
    apk --no-cache add curl wget git python3 bash && \
    ln -sf /usr/bin/python3 /usr/bin/python
RUN \
    mkdir app && \
    cd app
ADD download_spark.sh /app
RUN chown -R firsart:firsart /app
RUN cd /app && chmod +x download_spark.sh && sh download_spark.sh
#COPY dbg.crt SJAVA_HOME/jre/lib/security
RUN \
    cd $JAVA_HOME/jre/lib/security

USER firsart
WORKDIR /app