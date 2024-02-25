FROM docker.io/library/python:3.11-slim

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        openssh-client \
        wget \
        curl \
        vim

ENV ANSIBLE_CONFIG /etc/ansible/ansible.cfg
COPY ansible.cfg ${ANSIBLE_CONFIG}

RUN pip install --upgrade pip
RUN pip install \
        ansible

ENTRYPOINT [ "sh" ]
