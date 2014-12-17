## Deployment with Ansible:

	# test ping
	ansible web-servers -i inventory -u ubuntu --private-key=~/.ssh/aws.pem -m ping
	# test list of tasks
 	ansible-playbook -i inventory -u ubuntu --private-key=~/.ssh/aws.pem -s web-server.yml --list-tasks
	# install stuff on the host
 	ansible-playbook -i inventory -u ubuntu --private-key=~/.ssh/aws.pem -s web-server.yml
