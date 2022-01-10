#!/bin/bash

if [[ ! ($# -eq 2 && -f ~/ansible.key) ]] ; then
    echo "Usage: $0 encrypt/decrypt filename (~/ansible.key needed!)"
    exit 1
fi

if [[ -f $2 && $1 == "encrypt" ]] ; then
	docker run --rm -it \
		--env VAULT_KEY=$(cat ~/ansible.key) \
		-v $(pwd)/$2:/tmp/envfile:ro \
		kthb/ansible-vault
fi

if [[ -f $2 && $1 == "decrypt" ]] ; then
	docker run --rm -it \
		--env VAULT_KEY=$(cat ~/ansible.key) \
		-v $(pwd)/$2:/tmp/envfile:ro \
		kthb/ansible-vault bash -c 'cp /tmp/envfile secretz && ansible-vault view secretz'
fi
