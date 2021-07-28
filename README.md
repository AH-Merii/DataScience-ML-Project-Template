# Data Science Machine Learning Project Template
## About
### Directory Structure 
The `/data` dir should contain all the data that will be used in the project.
`/data/raw/` contains all the raw data used in the project. Raw Data must never be manually changed, any change to the raw data must be scripted and placed in the `/src/data/` dir. The output data should be stored in the `/data/processed/` dir.

`/models/` dir contains all the models created by any scripts in the `/src/model/` dir.

`/envs/` dir contains all the virtual `env.yml` files to be used. A preconfigured one is already created and can modified.

## Usage
Simply click the Use Template button on the top right of the repo and create your new repository.

## Pre-requisites
* `Conda`/`Miniconda` or `Mamba`
* `make`

### Installing the conda environment
`make env`
### Activating the conda environment
`conda activate ./.conda`

## Customization
* `envs/environment.yml`
* `Dockerfile`
* `.github/workflows/*`

This template comes pre-configured with git pre-commit hooks. To automatically run the pre-commits, activate the conda env and run `pre-commit install`.
More info about the pre-commits used can be found below.

## GitHub Actions
### check and pre-commit
Checks whether the pre-commits pass or not.

### Test Build and Push Docker
* Configures AWS Credentials (Need to have `AWS_SECRET_ACCESS_KEY` and `AWS_ACCESS_KEY_ID` added to repo secrets)
* Configures `DVC` in case some of the tests need to pull data from remote storage.
* Runs all the tests, if the tests pass build the docker image and push to registry.

### Hooks available

#### `check-added-large-files`
Prevent giant files from being committed.
  - Specify what is "too large" with `args: ['--maxkb=123']` (default=500kB).
  - Limits checked files to those indicated as staged for addition by git.
    
#### `check-json`
Attempts to load all json files to verify syntax.

#### `check-xml`
Attempts to load all xml files to verify syntax.

#### `check-yaml`
Attempts to load all yaml files to verify syntax.
    
#### `end-of-file-fixer`
Makes sure files end in a newline and only a newline.

#### `pretty-format-json`
Checks that all your JSON files are pretty.  "Pretty"
here means that keys are sorted and indented. 

#### `requirements-txt-fixer`
Sorts entries in requirements.txt and removes incorrect entry for `pkg-resources==0.0.0`

#### `sort-simple-yaml`
Sorts simple YAML files which consist only of top-level
keys, preserving comments and blocks.

#### `trailing-whitespace`
Trims trailing whitespace.

#### `flake8`
`Flake8` runs all the tools by launching the single `flake8` command. It displays the warnings in a per-file, merged output.

### `black`
Run `black` code formatter on files.

#### `blacken-docs`
Run `black` on python code blocks in documentation files.
