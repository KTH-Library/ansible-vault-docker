#!/bin/bash
set -e

echo $VAULT_KEY > $ANSIBLE_VAULT_PASSWORD_FILE
VAULT_KEY='************'

#echo $ENVFILE > /tmp/envfile
#ENVFILE='************'

exec "$@"
