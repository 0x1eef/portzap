## About

The portzap utility manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the _portzap group, and the copy of the source tree
can be installed into /usr/ports/ by root.

Certain portzap commands are restricted to members of the
_portzap group, while others require superuser privileges.
Group commands are delegated to the _portzap user via the
[doas(1)](https://man.openbsd.org/doas) utility instead of
being run by the user running a given command.

## CLI

#### Group

The following commands are restricted to members
of the _portzap group, and delegated to the
_portzap user via [doas(1)](https://man.openbsd.org/doas).
The configuration and initial setup of [doas(1)](https://man.openbsd.org/doas)
and /home/_portzap is automated via the `portzap setup`
command. See the [Install](#install) section for more details:

* portzap clone <br>
Clone the HardenedBSD ports tree into /home/_portzap/ports/ <br>

* portzap pull <br>
Pull updates into /home/_portzap/ports/ <br>

* portzap sh <br>
Run /bin/sh within /home/_portzap/ports/ <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* portzap rm <br>
Remove the contents of /usr/ports/ and /home/_portzap/ports/ <br>

* portzap install <br>
Install /home/_portzap/ports/ into /usr/ports/ <br>

## Install

#### Package

portzap is available
[from the HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/portzap).
<br>
pkg install portzap should work too but expect slower updates.

#### Source

The first step is to clone the repository. <br>
Afterwards portzap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/0x1eef/portzap
cd portzap
doas -u root -- make install
doas -u root -- make deinstall
```

#### Configuration

After installation is complete the portzap environment should be setup.
That involves the creation of the _portzap user and group, as well as
the creation of /home/_portzap. A user should also be added to the
_portzap group. The process is mostly automated:

```sh
doas -u root -- portzap setup
doas -u root -- pw groupmod _portzap -m <user> # Add group member
doas -u root -- portzap teardown               # Optional - reverse 'portzap setup'
```

## Environment

* __$PORTZAP\_CLONEURL__ <br>
  The URL of a git repository  <br>
  Default: https://github.com/HardenedBSD/HardenedBSD.git

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the source tree will be installed <br>
  Default: /usr/ports/

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
