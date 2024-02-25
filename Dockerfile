FROM docker.io/library/python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/jyje/ansible
LABEL org.opencontainers.image.description="Ansible Image"

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        jq \
        openssh-client \
        vim \
        wget

ENV ANSIBLE_CONFIG /etc/ansible/ansible.cfg
COPY ansible.cfg ${ANSIBLE_CONFIG}
COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install --upgrade --no-cache-dir -r /requirements.txt

ENTRYPOINT [ "sh" ]
