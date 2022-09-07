[![<ORG_NAME>](https://circleci.com/gh/QuangNguyen19/Uda_Devops_Capstone.svg?style=svg)](https://app.circleci.com/pipelines/github/QuangNguyen19/Uda_Devops_Capstone/85/workflows/0e37965a-c85e-4354-aba2-c73643bd5f30)

# Udacity Capstone

## Project

- circleci/aws-eks@2.2.0
- circleci/kubernetes@1.3.1

## Linting job

### Lint app

```
cd website
npm i
npm run lint
```

### Lint Docker file

```bash
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
chmod +x /bin/hadolint
cd website
hadolint Dockerfile --ignore  DL3006

```

## Build Docker file to run on localhost

### Build v1 image

```bash
. make.sh blue
```

### Build v2 image

```bash
. make.sh green
```

## Create eks cluster using aws-eks/create-cluster of aws-eks orbs

```bash
aws-eks/create-cluster:
                cluster-name: udadevops
                node-type: 't3.medium'
                nodes-max: 3
                nodes-min: 2

```

## Create deployment on cluster

Ensure you run right order of each step on create-deployment job:

- kubernestes/install using aws-kuberneste orbs
- aws-eks/update-kubeconfig-with-authenticator using aws-eks orbs
- kubernetes/create-or-update-resource using kuberneste orbs

## Update image of privous deployment to perform Rolling update

```bash
- aws-eks/update-container-image:
          get-rollout-status: true
          cluster-name: 'udadevops'
          container-image-updates: parrot=dangquanghui/parrot
          resource-name: deployment/parrot
          requires:
            - build-green
```

## Note: some job need manually trigger

- build-green
- delete-resource
