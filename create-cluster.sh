#!/bin/bash

eksctl create cluster \
--name $1 \
--version 1.17 \
--region $2 \
--nodegroup-name $3 \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key devops \
--managed