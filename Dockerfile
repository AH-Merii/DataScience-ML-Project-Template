FROM continuumio/miniconda3:4.9.2

WORKDIR /app

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential gcc

RUN conda update -n base -c defaults conda && \
    conda install mamba -n base -c conda-forge

COPY envs ./envs

COPY Makefile ./

RUN make env

COPY . .
