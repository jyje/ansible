FROM docker.io/library/python:3.13.12-slim

LABEL org.opencontainers.image.title="jyje/ansible"
LABEL org.opencontainers.image.description="Community-maintained Ansible Image"
LABEL org.opencontainers.image.source="https://github.com/jyje/ansible"
LABEL org.opencontainers.image.documentation="https://ansible.readthedocs.io/projects/ansible-build-data"
LABEL org.opencontainers.image.licenses="Multiple Licenses (MIT, GPL, etc)"
LABEL org.opencontainers.image.base.name="docker.io/library/python:3.12.8-slim"

ENV ANSIBLE_CONFIG /etc/ansible/ansible.cfg
COPY ansible.cfg ${ANSIBLE_CONFIG}
COPY requirements.txt /requirements.txt
COPY hello.sh /hello.sh
COPY install-essential.sh /install-essential.sh

RUN chmod +x /hello.sh
RUN chmod +x /install-essential.sh
RUN /install-essential.sh

RUN pip install --upgrade --no-cache-dir pip
RUN pip install --upgrade --no-cache-dir -r /requirements.txt

CMD ["/hello.sh"]
