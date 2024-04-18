#  lump_environment
A Docker image and devcontainer for [LUMP](https://github.com/divyam3897/UCL).

## Contents
- [`Dockerfile`](/Dockerfile)
- [`requirements.txt`](/requirements.txt)
- [`.devcontainer/devcontainer.json`](/.devcontainer/devcontainer.json)

## [`Dockerfile`](/Dockerfile)
`Dockerfile` defines experimental environment to guarantee the reproducibility.
This mainly consists of following 4 steps:

1. Based on the official [pytorch image](https://hub.docker.com/layers/pytorch/pytorch/1.9.1-cuda11.1-cudnn8-devel/images/sha256-fd8fcd6e1196d8965657b04e7dfb666046063904b767c1fd75df8039fe0ada17)
2. Install additional dependencies from `requirements.txt`
3.  Create non-root user (`exp`)
4.  Set work directory (`/workspace`)

## [`requirements.txt`](/requirements.txt)
`requirements.txt` is based on the [LUMP dependency](https://github.com/divyam3897/UCL/blob/main/requirements.txt).

## [`.devcontainer/devcontainer.json`](/.devcontainer/devcontainer.json)
A template of devcontainer setting.
This may not be necessary for building the experimental environment, but it is convenient to perform the experiment.
Please edit the value of `image` and argument `--shm-size` if you need.
