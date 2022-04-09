FROM python:3.10.4-alpine
RUN adduser -D myuser
WORKDIR /home/myuser
RUN apk update && apk upgrade
RUN apk add gcc musl-dev libffi-dev && \
    pip install --upgrade pip && \
    pip install PyGithub && \
    apk del gcc musl-dev libffi-dev
USER myuser
COPY --chown=myuser:myuser ./*.py .
CMD ["sh", "-c", "python accept_invitations.py --help"]