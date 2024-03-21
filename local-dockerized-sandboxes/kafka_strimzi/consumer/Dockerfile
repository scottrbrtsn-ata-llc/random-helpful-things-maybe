FROM python:3.10-alpine3.16

RUN pip install --upgrade pip

RUN \
 apk update && apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev

RUN  addgroup -S worker && adduser -S worker -G worker
USER worker
WORKDIR /home/worker/kafka

COPY --chown=worker:worker requirements.txt requirements.txt
COPY --chown=worker:worker main.py main.py

USER root
RUN chown worker:worker /home/worker/kafka
USER worker
RUN pip install --user -r requirements.txt

ENV PATH="/home/worker/.local/bin:${PATH}"

CMD ["faust", "-A", "main", "worker", "-l", "info"]
