# Ansible Docker Image
[![release](https://github.com/jyje/ansible/actions/workflows/release.yaml/badge.svg?branch=main)](https://github.com/jyje/ansible/actions/workflows/release.yaml)
[![develop ci-dev.yaml](https://github.com/jyje/ansible/actions/workflows/ci-dev.yaml/badge.svg?branch=develop)](https://github.com/jyje/ansible/actions/workflows/ci-dev.yaml)

🧑🏼‍🔧 This repository contains the CI pipeline for building an Ansible Docker image. It also provides a repository on ghcr.io for your DevOps usage. Supported architectures are `amd64`, `arm64`.

⚠️ This repository is not affiliated with the official Ansible project. This is a community-maintained project that provides a Docker image for Ansible users. The official Ansible project is maintained in ['ansible-community/ansible-build-data' repository](https://github.com/ansible-community/ansible-build-data). For more information about Ansible, visit the official website at https://ansible.readthedocs.io/projects/ansible-build-data

## Getting Started

I don't recommend using the source code in this repository directly. Instead, you should use the built Docker image from the ghcr.io repository. The image is built automatically on every commit to the main branch and pushed to the ghcr.io repository.

To use the Ansible Docker image in your DevOps workflows, pull the image from the ghcr.io repository using the following command:

```bash
docker pull ghcr.io/jyje/ansible
```

## CI Pipeline

The CI pipeline in this repository is responsible for building the Ansible Docker image. It can be customized to fit your specific requirements. The pipeline is triggered on every commit to the main branch and automatically builds and pushes the Docker image to the ghcr.io repository.

## Usage

To use the Ansible Docker image in your DevOps workflows, follow these steps:

1. Pull the Docker image from the ghcr.io repository.

```bash
docker pull ghcr.io/jyje/ansible
```
2. Run the Docker container using the pulled image.
3. Execute your Ansible playbooks and tasks inside the running container.

### Using Specific Version

You can use a specific version of the Ansible Docker image by specifying the version tag. For example, to use version `v9.5.1`, use the following command:

```bash
docker pull ghcr.io/jyje/ansible:v9.5.1
```



# Preinstalled Utilities
This image provides following utilities preinstalled:
```
- ansible
- python
- pip

- curl
- git
- jq
- openssh-client
- vim
- wget
```
