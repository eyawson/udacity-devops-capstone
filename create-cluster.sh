#!/bin/bash

eksctl create cluster \
--name capstone \
--version 1.17 \
--region us-west-2 \
--nodegroup-name capstone-nodes \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key devops \
--managed

eksctl get cluster --name=capstone