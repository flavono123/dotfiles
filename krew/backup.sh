#!/usr/bin/env bash

# install custom index flew
# https://github.com/flavono123/flew-index?tab=readme-ov-file#install
kubectl krew index add flew https://github.com/flavono123/flew-index.git

# install all plugin in backup.txt
kubectl krew install $(cat backup.txt)
