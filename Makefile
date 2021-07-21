.ONESHELL:
SHELL=/bin/bash

CONDA_ENV_FILE=envs/environment.yml

# activate conda
CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

# dummy targets
.PHONY: all clean run env

all: env run

clean: ## Remove generated files
	rm -f data/raw/*
	rm -f data/processed/*
	rm -f data/figures/*
	rm -f models/*
	rm -rf .conda

run: ;

test: .conda/ ## Run tests using pytest
	$(CONDA_ACTIVATE) ./.conda
	pytest

env : ## Set up the conda environment
	((mamba env create --prefix .conda -f $(CONDA_ENV_FILE) ||\
	mamba env update --prefix .conda -f $(CONDA_ENV_FILE)) &&\
	mamba clean --all --yes) ||\
	((conda env create --prefix .conda -f $(CONDA_ENV_FILE) ||\
	conda env update --prefix .conda -f $(CONDA_ENV_FILE)) &&\
	conda clean --all --yes)

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-38s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
