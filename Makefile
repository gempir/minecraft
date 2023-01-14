.PHONY: *

ansible:
	cd ansible && ansible-vault decrypt ssh_key.vault --output=.ssh_key
	chmod 600 ansible/.ssh_key

provision:
	cd ansible && OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook -i hosts playbook.yml --private-key=.ssh_key