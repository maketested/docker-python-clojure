FROM circleci/python:3.7.6-stretch-browsers

# Python

RUN sudo pip install --upgrade pip && \
pip --version

# Pipenv

RUN sudo pip install pipenv==2018.11.26 && \
pipenv --version

# Poetry
RUN sudo pip install poetry==1.0.5 && \
poetry --version

# Leiningen

RUN sudo wget -q -O /usr/bin/lein \
https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
sudo chmod +x /usr/bin/lein && \
lein --version

# Firefox

RUN sudo wget https://ftp.mozilla.org/pub/firefox/releases/70.0/linux-x86_64/en-US/firefox-70.0.tar.bz2 && \
sudo tar -xjf firefox-70.0.tar.bz2 && \
sudo rm -rf /opt/firefox* && \
sudo rm firefox-70.0.tar.bz2 && \
sudo mv firefox /opt/firefox70 && \
sudo ln -sf /opt/firefox70/firefox-bin /usr/bin/firefox && \
firefox --version

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz \
| sudo tar xz -C /usr/local/bin && \
geckodriver --version
