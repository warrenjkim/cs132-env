# CS132 Docker Container
This docker container runs Java 17 and Gradle 8.7.

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

### Testing Individual test cases
To test a single testcase, run:
```
ccenv test hw[12345]/[testcase] [your project root]
```

### Gradle run
To run `gradle run` in the container, run:
```
ccenv gradle run hw[12345]/[testcase] [your project root]
```

For example, if your project root is `hw1`,
```
ccenv run hw1/test01 hw1
```
will run `gradle run <testcases/hw1/test01` with `hw1` as the project root.


### Gradle pregrade
To run the pregrade script in the container, run:
```
ccenv gradle pregrade [your project root]
```

## TLDR
If you're too lazy to manually run the above commands to install, run:
```bash
git clone https://github.com/warrenjkim/cs132-env \
&& cd cs132-env \
&& source bin/init [mount_dir]
```
replacing `[mount_dir]` with the appropriate directory.
