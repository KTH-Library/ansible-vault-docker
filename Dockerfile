FROM alpine 

ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV VAULT_KEY=''
ENV ANSIBLE_VAULT_PASSWORD_FILE='/.vault_key'

RUN apk add \
	ansible gcc python3-dev libc-dev libffi-dev openssl-dev bash py3-pip

RUN pip3 install --upgrade paramiko

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#CMD ansible-vault encrypt /tmp/envfile --vault-password-file=.vault_key --encrypt-vault-id=default --output=- | tail -n +1

CMD cp /tmp/envfile secretz && ansible-vault encrypt secretz > /dev/null && cat secretz

#CMD cp /tmp/envfile secretz && ansible-vault view secretz
