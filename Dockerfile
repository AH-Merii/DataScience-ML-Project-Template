FROM continuumio/miniconda3:4.9.2

WORKDIR /app

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential gcc

RUN conda update -n base -c defaults conda

COPY environment.yml Makefile ./

RUN make .conda

COPY . .