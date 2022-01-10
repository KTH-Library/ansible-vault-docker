# Using ansible-vault

For when the `ansible-vault` command is required as a container.

## Using the `av.sh` script

This docker container can be used with a `av.sh` shell wrapper to encrypt and decrypt ansible vaults.

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

## Inspirations

A few write-ups related to using "ansible-vault" in GitHub Actions:

- https://github.com/anthonykgross/ansible-vault-cli-github-action
- https://misfra.me/2019/10/using-ansible-with-github-actions/
