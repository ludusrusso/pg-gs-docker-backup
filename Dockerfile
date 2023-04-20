FROM google/cloud-sdk:alpine
LABEL maintainer="Ludovico Russo <ludus.russo@gmail.com>"

# Install deps postgresql-client
RUN apk update && apk add --no-cache postgresql15-client

ADD run.sh run.sh

CMD ["sh", "run.sh"]
