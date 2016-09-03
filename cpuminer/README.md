# Run cpuminer as a Docker container

* [cpuminer](https://github.com/pooler/cpuminer), a "multi-threaded CPU miner for Litecoin and Bitcoin"
* [Docker](https://www.docker.io/), Linux containers

## Usage

First, build your container:

    git clone https://github.com/heichblatt/docker-cpuminer.git
    cd docker-cpuminer
    docker build --tag="cpuminer" .

Then run it and append all parameters you would pass to `cpuminerd` to the docker command:

    docker run -i cpuminer --help
    docker run cpuminer --benchmark
