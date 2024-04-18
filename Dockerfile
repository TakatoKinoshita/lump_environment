FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

# Settings
ARG USERNAME=exp
ARG USER_UID=1234
ARG USER_GID=$USER_UID
ARG WORK_DIR=/workspace

# Install additional dependencies
COPY requirements.txt /tmp/requirements/
RUN conda config --add channels conda-forge \
    && conda install -y --file /tmp/requirements/requirements.txt \
    && rm -rf /tmp/requirements

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME

# Set WORKDIR
WORKDIR $WORK_DIR

# Set default command
# CMD ["python3"]
