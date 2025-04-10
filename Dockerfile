FROM python:3.10-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    nano \
    net-tools \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

COPY ssh /root/.ssh
RUN chmod 600 /root/.ssh/* && \
    ssh-keyscan git.corp.adobe.com >> /root/.ssh/known_hosts

# Install pip (already present) and poetry
RUN pip install --no-cache-dir pip --upgrade \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# CMD ["bash"]

