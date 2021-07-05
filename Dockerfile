FROM circleci/python:3.9-node-browsers

# Leiningen

RUN sudo wget -q -O /usr/bin/lein \
https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
sudo chmod +x /usr/bin/lein && \
lein --version

# Firefox

RUN sudo wget https://ftp.mozilla.org/pub/firefox/releases/89.0/linux-x86_64/en-US/firefox-89.0.tar.bz2 && \
sudo tar -xjf firefox-89.0.tar.bz2 && \
sudo rm -rf /opt/firefox* && \
sudo rm firefox-89.0.tar.bz2 && \
sudo mv firefox /opt/firefox70 && \
sudo ln -sf /opt/firefox70/firefox-bin /usr/bin/firefox && \
firefox --version

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz \
| sudo tar xz -C /usr/local/bin && \
geckodriver --version

# Graphviz

RUN sudo apt install graphviz graphviz-dev && \
dot -V
