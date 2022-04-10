FROM python:3.10.4-alpine
RUN adduser -D myuser
WORKDIR /home/myuser
RUN apk add --no-cache --virtual my_build_tools gcc musl-dev libffi-dev && \
    pip install --no-cache-dir --upgrade pip==22.0.4 && \
    pip install --no-cache-dir PyGithub==1.55 && \
    apk del my_build_tools
USER myuser
COPY --chown=myuser:myuser ./*.py .
ENV PYTHONUNBUFFERED=1
CMD ["sh", "-c", "python accept_invitations.py --help"]