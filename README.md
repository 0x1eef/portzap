## About

The portzap utility manages a local copy of the
[HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports).
The copy of the ports tree is maintained by members of
the `_portzap` group, and the copy of the ports tree
can be installed into /usr/ports/ by root.

## Roles

#### User

The following commands are restricted to members of the `_portzap` group. <br>
The commands are delegated to the
`_portzap` user via the [doas(1)](https://man.openbsd.org/doas) command:

* portzap clone <br>
Clone the HardenedBSD ports tree into `/home/_portzap/ports/` <br>

* portzap pull <br>
Pull updates into `/home/_portzap/ports/` <br>

* portzap sh <br>
Run /bin/sh within `/home/_portzap/ports/` <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* portzap rm <br>
Remove the contents of `/usr/ports/` and `/home/_portzap/ports/` <br>

* portzap install <br>
Install `/home/_portzap/ports/` into `/usr/ports/` <br>

## Configuration

#### Superuser

After installation is complete the portzap environment should be setup.

That includes the creation of the `_portzap` user and group, as well as
the creation of `/home/_portzap`. A user should also be added to the
`_portzap` group. The process is mostly automated, and the following
commands should be run as a superuser:

* portzap setup <br>
Creates the `_portzap` user and group, and the `/home/_portzap` directory <br>

* portzap teardown <br>
Tears down the `_portzap` user and group, and removes the `/home/_portzap` directory <br>

* pw groupmod _portzap -m `<user>` <br>
Add a user to the `_portzap` group. <br>

## Install

#### Package

portzap is available
[from the HardenedBSD src tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/portzap).
<br>
"pkg install portzap" should work too but expect slower updates.

#### Source

The first step is to clone the repository. <br>
Afterwards portzap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/0x1eef/portzap
cd portzap
doas -u root -- make install
doas -u root -- make deinstall
```

## Requirements

* [doas](https://man.openbsd.org/doas)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/portzap)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/portzap)
* [hardenedbsd.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/portzap)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
