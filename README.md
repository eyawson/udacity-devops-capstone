# Pipeline Capstone Project

## Description

This is the capstone of the Udacity DevOps Nanodegree course.
You will develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. You will also develop your Continuous Integration steps as you see fit, but must at least include typographical checking (aka “linting”). To make your project stand out, you may also choose to implement other checks such as security scanning, performance testing, integration testing, etc.!

Once you have completed your Continuous Integration you will set up Continuous Deployment, which will include:

Pushing the built Docker container(s) to the Docker repository (you can use AWS ECR, create your own custom Registry within your cluster, or another 3rd party Docker repository) ; and
Deploying these Docker container(s) to a small Kubernetes cluster. For your Kubernetes cluster you can either use AWS Kubernetes as a Service, or build your own Kubernetes cluster. To deploy your Kubernetes cluster, use either Ansible or Cloudformation. Preferably, run these from within Jenkins as an independent pipeline.

## Technologies Sources

- [Application Source](https://github.com/gothinkster/realworld)

- [Docker](https://hub.docker.com)

- Container Service: Kubernetes

- CI/CD: Jenkins

- Orchestration: Ansible

- AWS Services(EKS, EC2, IAM roles)

### Getting Started

- Clone this repo

### Installation (without container)

Install dependencies `npm install`

Start frontend `npm run dev`

### Installation (container)

Docker pull from akwele/capstone

References:

- <https://medium.com/better-programming/turn-your-own-docker-image-into-an-auto-scaling-kubernetes-deployment-using-amazon-eks-bd2ab8ef56cc>

- <https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html>

- <https://www.notion.so/Capstone-a6e4906eee484c15b9a8fac978bfb799#45cf0ccd056a4d7f85488fb882c2a340>

- <https://www.notion.so/Capstone-a6e4906eee484c15b9a8fac978bfb799#94dddae949594828983034b1be5b7462>

- Stackoverflow

- Google Google GOogle
