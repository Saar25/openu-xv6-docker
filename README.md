# openu-xv6-docker

This repo is a fork of xv6-docker that should help students run xv6 with ease,  
it includes all the changes made by the open university for mmn11  
you can also change the code and it would sync with the code inside the container

## Getting Started

Install docker in order to run the project

Next, run the following command to run the container (you can change mmn11 to mmn12 to mmn13)

```bash
docker compose run --rm mmn11
```

You should now be connected to the container, next run xv6 using qemu

```bash
make qemu-nox
```

When you want to shut down the program, press `Ctrl+A x`, that will tell qemu to exit  
to close the container press `Ctrl+D`

You can run the openu solution using

```bash
make qemuss-nox
```

and gdb using

```bash
make qemu-nox-gdb
```
