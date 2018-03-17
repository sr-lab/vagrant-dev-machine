#!/bin/bash
source "/vagrant/scripts/common.sh"

function installExtraPackages {
	echo "install extra packages (sr-lab)"
	apt-get install -y maven
}

function cloneGithubRepositories {
	echo "cloning sr-lab github repositories"
	cd /home/ubuntu
	mkdir sr-lab; cd sr-lab
	echo "Visit https://github.com/sr-lab to see which repositories you can clone." > README.txt
	chown -R -L ubuntu:ubuntu /home/ubuntu/sr-lab
	chown -R ubuntu:ubuntu /home/ubuntu/sr-lab
}

funcs=(installExtraPackages cloneGithubRepositories)

echo "sr-lab additional configuration"
for func in "${funcs[@]}"
do
	$func || fail $func
done

