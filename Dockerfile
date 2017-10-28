FROM circleci/python:3.6.3-stretch-browsers

# Pipenv

RUN sudo pip install --upgrade pipenv && pipenv --version
