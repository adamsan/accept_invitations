FROM python:3.10.4-alpine
WORKDIR /app
RUN apk update && apk upgrade
RUN apk add gcc musl-dev libffi-dev
RUN pip install PyGithub
COPY ./*.py .
CMD ["sh", "-c", "python accept_invitations.py --help"]