FROM ubuntu:22.04

ARG DBT_PROJECT="dbt-project"

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    curl \
    git \
    mysql-client \
    pip \
    python-is-python3 \
    python3-dev \
    tzdata \
    unzip \
    wget

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN git config --global --add safe.directory /workspace
RUN git config --global --add safe.directory /workspace/${DBT_PROJECT}
