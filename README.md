# Accept invitations

## Description

A small python program, that can connect to github, and accept all pending invitations, grantad, if it's not expired.
In order to connect to github, it needs a token (https://github.com/settings/tokens) with **'Access repository invitations'** right enabled.

## Running locally


### Setup
Python version used: `3.10` (activate venv, if necessaty)

`pip install PyGithub`

### Running
`python accept_invitations.py --token=<generated token>`

## Running with docker

### Building the image

`docker build -t accept_invites .`

### Or pull image from docker hub

docker pull adamsan/accept_invites:latest

### Running 

`docker run --rm --name test_py -it accept_invites python accept_invitations.py --token <generated token>`
