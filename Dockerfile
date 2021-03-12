FROM python:2.7-alpine

RUN apk add --update --no-cache libressl-dev libffi-dev musl-dev postgresql-dev gcc make bash postgresql-client && \
   pip --no-cache-dir install aws-sam-cli awscli && \
   apk add --update --no-cache jq nodejs npm postgresql-libs

RUN sam --version
#RUN apk add --no-cache --virtual builddeps gcc musl-dev && \
#   pip --no-cache-dir install aws-sam-cli awscli && \
#   apk add jq nodejs npm && \
#   apk del builddeps

# drone creates a workspace with root, so user switching does not make sense
#RUN	adduser -s /bin/bash samcli \
#	--disabled-password \
#	&& echo 'samcli ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

#RUN mkdir drone \
#    && chown -R samcli.samcli /drone

#USER samcli

#WORKDIR /drone
