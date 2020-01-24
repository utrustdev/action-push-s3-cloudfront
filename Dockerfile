FROM python:3.7-alpine

RUN pip install --quiet awscli==1.16.265

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
