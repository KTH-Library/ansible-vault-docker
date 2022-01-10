# Using ansible-vault

The `ansible-vault` command is required.

It can be used from a github action (but gita does not support actions):

- https://github.com/anthonykgross/ansible-vault-cli-github-action
- https://misfra.me/2019/10/using-ansible-with-github-actions/


## The `av.sh` script

So this docker container can be used with a `av.sh` script wrapper to encrypt and decrypt ansible vaults.

It expects `~/ansible.key` to be present!

For example

	# with av.sh placed in ~/bin

	# encrypt
	av.sh encrypt secrets.decrypted.env > secrets.env

	# decrypt
	av.sh decrypt secrets.env


## Using docker command invocations

	# encrypt environment variables file
	docker run --rm -it --env VAULT_KEY=$(cat ~/ansible.key) -v $(pwd)/secrets.decrypted.env:/tmp/envfile:ro kthb/ansible-vault > secrets.env

	# decrypt environment variables file
	docker run --rm -it --env VAULT_KEY=$(cat ~/ansible.key) -v $(pwd)/secrets.env:/tmp/envfile:ro kthb/ansible-vault bash -c "cp /tmp/envfile secretz && ansible-vault view secretz"

