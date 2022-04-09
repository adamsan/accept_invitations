FROM python:3.10.4-alpine
RUN adduser -D myuser
WORKDIR /home/myuser
RUN apk update && apk upgrade
RUN apk add --virtual my_build_tools gcc musl-dev libffi-dev && \
    pip install --upgrade pip && \
    pip install PyGithub && \
    apk del my_build_tools
USER myuser
COPY --chown=myuser:myuser ./*.py .
ENV PYTHONUNBUFFERED=1
CMD ["sh", "-c", "python accept_invitations.py --help"]