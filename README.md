## yarn - Yarn is fast, reliable, and secure dependency management
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/yarn.svg)](https://hub.docker.com/r/rvannauker/yarn/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/yarn.svg)](https://hub.docker.com/r/rvannauker/yarn/) [![](https://images.microbadger.com/badges/image/rvannauker/yarn:latest.svg)](https://microbadger.com/images/rvannauker/yarn:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-yarn.svg)](https://github.com/RichVRed/docker-yarn) [![license](https://img.shields.io/github/license/RichVRed/docker-yarn.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run yarn

### Installation / Usage
1. Install the rvannauker/yarn container:
```bash
docker pull rvannauker/yarn
```
2. Run yarn through the yarn container:
```bash
sudo docker run --rm --name="yarn" "rvannauker/yarn" {command}
```
3. Optionally create a bash alias:
```bash
alias yarn="docker run --interactive=true --rm=true rvannauker/yarn:<version>"
```

### Download the source:
To run, test and develop the SassC Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-yarn.git
```
2. Build the container:
```bash
sudo docker build --force-rm --tag "rvannauker/yarn" --file yarn.dockerfile .
```
3. Test running the container:
```bash
 $ docker run rvannauker/yarn --help
```