# Beancount Docker

This repository contains Docker files for running [Beancount](https://github.com/beancount/beancount), a simple double-entry accounting system.

## Prerequisites 
- These scripts assume that a ledger file is present at `../data/ledger.bean`.  
- I recommend keeping this data in a separate repo

## Setup:
1. Clone repo:  
 ```
git clone https://github.com/thekabistro/beancount-docker
cd beancount-docker
```

2. Build docker image using shell script
```
cd scripts
./create-image.sh
```

If any modifications are needed to the installation, change the Dockerfile and rerun this script. 

## Usage:
- Use shell scripts to start container & pass in beancount commands
- **Fava:** `./fava-exec.sh`to start the web interface
- **Bean comamnd with file** use `./bean-exec.sh <bean command>` for any bean command with a reference to the ledger file appended. 
  - For example to run:  `bean-check ledger.bean` use `./bean-exec.sh bean-check`
- **Other commands**: `bean-custom.sh <command>` 

## My common usages:
- **Extraction from CSV:** `./bean-exec.sh bean-extract bean/config.py bean/csv_path`
- **Fava:** `./fava-exec.sh`
- **Bean-check:** `./bean-exec.sh bean-check`
- **Web reports:**`./bean-web.sh`

## Debugging:
Debugging the distroless container can be tricky if you need to directly interact with the container.  This can be done by switching to a debug image (this will link some busybox utils that enable shell access).  

To switch to a debug image, add the debug flag to the Docker image:

```
FROM gcr.io/distroless/python3-debian11:debug
```

Then rebuild and run the container interactively with shell access, with the following command:
```
./create-image.sh
docker run --rm -v $PWD/data:/bean -e BEANCOUNT_FILE=/bean/ledger.bean --name beancount-fava --entrypoint /bin/sh -it beans 
```

# Inspiration
Dockerfile is taken from [Yegle](https://github.com/yegle/fava-docker) and modified further:

