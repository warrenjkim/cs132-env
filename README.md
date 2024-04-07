# CS132 Docker Container
This docker container runs Java 8 and Gradle 8.7.

## Installation
First, clone this repository:
```console
git clone https://github.com/warrenjkim/cs132-env
```
or
```console
git clone git@github.com/warrenjkim/cs132-env.git
```

Then run the following to start the container:
```console
user@host:~$ cd cs132-env
user@host:~$ source bin/init [mount_dir]
```
replacing `mount_dir` with your desired mount. By default, it will
set the mount directory to `cs132-env`. For example, if your project structure
looks like the following:
```
cs132
├── hw1
├── hw2
├── hw3
├── hw4
└── hw5
```
set `mount_dir` to `cs132`.


### Commands
To start the container, run:
```
cmd start
```

To stop the contianer, run:
```
cmd stop
```

To remove the container and unset all exported variables, run:
```bash
source cmd remove
```
This will also reset your `$PATH` variable.


## Gradle commands
To run a gradle command in the container, run:
```
cmd [your gradle command here] [your project root]
```

For example, if your project root is `hw1`,
```
cmd test hw1
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
