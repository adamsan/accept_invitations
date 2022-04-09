FROM python:3.10.4-alpine
RUN adduser -D myuser
WORKDIR /home/myuser
RUN apk update && apk upgrade
RUN apk add gcc musl-dev libffi-dev
USER myuser
RUN pip install --upgrade pip
RUN pip install PyGithub
COPY --chown=myuser:myuser ./*.py .
CMD ["sh", "-c", "python accept_invitations.py --help"]