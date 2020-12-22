FROM circleci/python:3.7.9-browsers

# Python

RUN sudo pip install --upgrade pip && \
pip --version

# Pipenv

RUN sudo pip install --upgrade pipenv && \
pipenv --version

# Poetry
RUN sudo pip install poetry==1.1.4 && \
poetry --version

# Leiningen

RUN sudo wget -q -O /usr/bin/lein \
https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
sudo chmod +x /usr/bin/lein && \
lein --version

# Firefox

RUN sudo wget https://ftp.mozilla.org/pub/firefox/releases/84.0/linux-x86_64/en-US/firefox-84.0.tar.bz2 && \
sudo tar -xjf firefox-84.0.tar.bz2 && \
sudo rm -rf /opt/firefox* && \
sudo rm firefox-84.0.tar.bz2 && \
sudo mv firefox /opt/firefox70 && \
sudo ln -sf /opt/firefox70/firefox-bin /usr/bin/firefox && \
firefox --version

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-linux64.tar.gz \
| sudo tar xz -C /usr/local/bin && \
geckodriver --version
