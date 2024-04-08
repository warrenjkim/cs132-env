# CS132 Docker Container
This docker container runs Java 8 and Gradle 8.7.

## Requirements
Docker Compose

## Installation
First, clone this repository:
```console
git clone https://github.com/warrenjkim/cs132-env
```
or
```console
git clone git@github.com/warrenjkim/cs132-env.git
```

Then once inside `cs132-env`, run the following to start the container:
```
source bin/init [mount_dir]
```
replacing `mount_dir` with your desired mount. If you do not specify a
directory, it will set the mount directory to `cs132-env`. For example, if your
project structure looks like the following:
```
cs132
├── hw1
├── hw2
├── hw3
├── hw4
└── hw5
```
set `mount_dir` to `cs132`.

## Commands
To start the container, run:
```
ccenv start
```

To stop the container, run:
```
ccenv stop
```

To remove the container and unset all exported variables, run:
```bash
source ccenv remove
```
* **Note:** This will also remove `/path/to/cs132-env/bin` from `$PATH`.

To see which project roots are mounted, run:
```
ccenv ls
```

### Gradle commands
To run a gradle command in the container, run:
```
ccenv [your gradle command here] [your project root]
```

For example, if your project root is `hw1`,
```
ccenv test hw1
```
will run `gradle test` with `hw1` as the project root.

## TLDR
If you're too lazy to manually run the above commands to install, run:
```bash
git clone https://github.com/warrenjkim/cs132-env \
&& cd cs132-env \
&& source bin/init [mount_dir]
```
replacing `[mount_dir]` with the appropriate directory.


# Manual Installation (GHCR)
The docker image can also be run manually. Start by pulling the docker image:
```console
docker pull ghcr.io/warrenjk/cs132-env:[arch]
```
replacing `arch` with your architecture. For example, if you are on Apple
Silicon, you would run:
```console
docker pull ghcr.io/warrenjk/cs132-env:arm64
```
* **Note:** If you do not specify a tag, it will pull `arm64` by default.

## Commands
To start the image in detached mode, run:
```console
docker run -d --rm --name '[container_name]' -v [mount_dir]:/cs132 warrenjk/cs132-env:[arch]
```
replacing `container_name`, `mount_dir`, and `arch` appropriately. For example,
if you are on Apple Silicon, you would run:
```console
docker run -d --rm --name 'cs132-env' -v .:/cs132 warrenjk/cs132-env:arm64
```

To stop the image, run:
```console
docker stop [container_name] -t 0
```
replacing `container_name` appropriately.

To run commands, run:
```console
docker exec [container_name] bash -c [your command]
```
