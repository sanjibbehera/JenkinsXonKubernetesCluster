#!/bin/bash

sudo curl -L "https://github.com/jenkins-x/jx/releases/download/$(curl --silent "https://github.com/jenkins-x/jx/releases/latest"| sed 's#.*tag/\(.*\)\".*#\1#')/jx-linux-amd64.tar.gz" | tar xzv "jx"
		
sudo mv jx /usr/local/bin && sudo jx install --provider=kubernetes --on-premise