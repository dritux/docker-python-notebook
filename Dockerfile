FROM python:3.6.5

LABEL maintainer="Adriano Fialho <adriano.fialho@fs.com.br>"

USER root

# Install all OS dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    locate \
    vim \
    python-pip \
    python-virtualenv

WORKDIR /app/data

# Setup virtualenv
RUN pip install virtualenvwrapper
RUN export WORKON_HOME=$HOME/.virtualenvs >> $HOME/.bashrc
RUN echo "source \"/usr/local/bin/virtualenvwrapper.sh\"" >> $HOME/.bashrc

COPY run-notebook.sh /app/
RUN chmod 777 /app/run-notebook.sh
RUN chmod 777 /app

VOLUME /app/data
EXPOSE 8888

CMD ["/app/run-notebook.sh"]
