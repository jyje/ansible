# Unofficial Ansible Docker Image
[![release](https://github.com/jyje/ansible/actions/workflows/ci-main.yaml/badge.svg?branch=main)](https://github.com/jyje/ansible/actions/workflows/ci-main.yaml)
[![test](https://github.com/jyje/ansible/actions/workflows/ci-develop.yaml/badge.svg?branch=develop)](https://github.com/jyje/ansible/actions/workflows/ci-develop.yaml)
[![cron](https://github.com/jyje/ansible/actions/workflows/cron-fetch-pip.yaml/badge.svg)](https://github.com/jyje/ansible/actions/workflows/cron-fetch-pip.yaml)
[![GitHub Repo stars](https://img.shields.io/github/stars/jyje/ansible)](https://github.com/jyje/ansible)

[English](readme.md) / [한국어](readme-ko.md)

🧑🏼‍🔧 이 리포지토리는 Ansible Docker 이미지를 빌드하기 위한 CI 파이프라인을 포함하고 있습니다. 또한 DevOps 사용을 위한 ghcr.io 리포지토리를 제공합니다. 지원되는 아키텍처는 `linux/amd64`, `linux/arm64`입니다.

> [!IMPORTANT]
> 이 리포지토리는 공식 Ansible 프로젝트와 관련이 없습니다. 이는 Ansible 사용자를 위한 Docker 이미지를 제공하는 커뮤니티 유지 프로젝트입니다. 공식 Ansible 프로젝트는 ['ansible-community/ansible-build-data' 리포지토리](https://github.com/ansible-community/ansible-build-data)에서 유지 관리됩니다. Ansible에 대한 자세한 정보는 https://ansible.readthedocs.io/projects/ansible-build-data 공식 웹사이트를 방문하세요.

## Getting Started

이 리포지토리의 소스 코드를 직접 사용하는 것은 권장하지 않습니다. 대신, ghcr.io 리포지토리에서 빌드된 Docker 이미지를 사용하시는 걸 추천합니다. 이미지는 `main` 브랜치가 갱신될 때마다 자동으로 빌드되어 ghcr.io 리포지토리에 푸시됩니다.

DevOps 워크플로우에서 Ansible Docker 이미지를 사용하려면 다음 명령어를 사용하여 ghcr.io 리포지토리에서 이미지를 가져오세요:

```bash
docker pull ghcr.io/jyje/ansible
```

## CI Pipeline

이 저장소의 CI 파이프라인은 Ansible Docker 이미지를 빌드하는 역할을 합니다. 특정 요구 사항에 맞게 커스터마이징할 수 있습니다. 파이프라인은 main 브랜치에 커밋될 때마다 트리거되며, 자동으로 Docker 이미지를 빌드하고 ghcr.io 레지스트리에 푸시합니다.

## Usage

DevOps 워크플로우에서 Ansible Docker 이미지를 사용하려면 다음 단계를 따라하시면 됩니다:

1. (선택) 도커 이미지를 풀링하세요.

```bash
docker pull ghcr.io/jyje/ansible
```

2. 도커 명령어를 이용해 컨테이너를 실행하세요.

```bash
docker run --rm -it ghcr.io/jyje/ansible ansible --help
# 또는
docker run --rm -it ghcr.io/jyje/ansible ansible-playbook --help
# 또는
docker run --entrypoint sh --rm -it ghcr.io/jyje/ansible
```

3. 컨테이너 내부에서 실행할 Ansible 플레이북과 작업을 실행하세요.

### Using Specific Version

특정 버전의 Ansible Docker 이미지를 사용하려면 버전 태그를 지정하세요. 예를 들어 `v9.2.0` 버전을 사용하려면 다음 명령어를 입력하세요:

```bash
docker pull ghcr.io/jyje/ansible:v9.2.0
```

사용 가능한 버전 목록은 [ghcr.io 리포지토리](https://github.com/jyje/ansible/pkgs/container/ansible)에서 확인할 수 있습니다.

# Preinstalled Utilities

이미지에는 다음과 같은 유틸리티가 미리 설치되어 있습니다:
```
- ansible >= 9.2.0
- python == 3.12.8
- pip

- curl
- git
- jq
- openssh-client
- vim
- wget
```
