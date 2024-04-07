# CS132 Docker Container
This docker container runs Java 8 and Gradle 8.7.

## Installation
First, clone this repository:
```bash
git clone https://github.com/warrenjkim/cs132-env
```
or
```bash
git clone git@github.com/warrenjkim/cs132-env.git
```

Then run the following to start the container:
```console
user@host$ cd cs132-env
user@host$ source bin/init
```

### Commands
To start the container, run:
```bash
cmd start
```

To stop the contianer, run:
```bash
cmd stop
```

To remove the container and unset any exported variables, run:
```bash
cmd remove
```
This will also reset your `$PATH` variable.


## Gradle commands
To run a gradle command in the container, run:
```bash
cmd [your gradle command here] [your project root]
```

For example, if your project root is `hw1`,
```console
cmd test hw1
```
will run `gradle test` with `hw1` as the project root.


## TLDR
If you're too lazy to manually run the above commands to install, run:
```bash
git clone https://github.com/warrenjkim/cs132-env && cd cs132-env && source bin/init
```
