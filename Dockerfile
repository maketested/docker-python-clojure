FROM circleci/python:3.6.3-stretch-browsers

# Pipenv

RUN sudo pip install --upgrade pipenv && \
pipenv --version

# Leiningen

RUN sudo wget -q -O /usr/bin/lein \
https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
sudo chmod +x /usr/bin/lein && \
lein --version

# Firefox WebDriver

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz \
| sudo tar xz -C /usr/local/bin && \
geckodriver --version
