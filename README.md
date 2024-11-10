# openu-xv6-docker

This repo is a fork of xv6-docker that should help students run xv6 with ease,  
it includes all the changes made by the open university for mmn11  
you can also change the code and it would sync with the code inside the container

## Getting Started

Install docker in order to run the project

Next, run the following command to run the container

```bash
docker compose run --rm xv6
```

You should now be connected to the container

split the terminal using tmux, that will help you later to shutdown xv6

```bash
tmux
```

And then `CTRL+B "` or `CTRL+B %` to split the terminal (swap between them using `CTRL+B O` )

In one pane run the os using

```bash
make qemu-nox
```

And when you want to shut it down, swap to the other pane and search the process id using `ps -a`, then kill it using `kill ...`

You can also run the openu solution using

```bash
make qemuss-nox
```

and gdb using

```bash
make qemu-nox-gdb
```
