FROM circleci/python:3.6.3-stretch-browsers

# Pipenv

RUN sudo pip install --upgrade pipenv && \
pipenv --version

# Leiningen

RUN sudo wget -q -O /usr/bin/lein \
https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
sudo chmod +x /usr/bin/lein && \
lein --version
