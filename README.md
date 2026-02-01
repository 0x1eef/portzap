## About

The portzap utility manages a local copy of the
[hardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports)
in a way that is efficient, scalable, and secure. The
utility provides consistent ownership and permissions
for the ports tree, maintains a clean separation between
root-only operations and unprivileged operations, and
offers a simple workflow for updating and installing
the ports tree.

## Features

* A simple workflow: clone, pull, then install.
* One dedicated account (`_portzap`) for managing the ports tree.
* Clear permissions: mac_do(4) rules decide who can act as `_portzap`.
* Separates unprivileged operations from root-only operations.
* Keeps ownership and permissions consistent in `/home/_portzap/ports/` and `/usr/ports/`.
* Uses `rsync` and `git` for fast, efficient updates.

## Commands

#### User

The following commands are delegated to the `_portzap` user and
authorized by mac_do(4) rules. By default you must be root or a
member of the `_portzap` group to run the following commands:

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

* portzap apply <br>
Apply security.mac.do.rules for portzap <br>
Allows root and members of the `_portzap` group to act as the `_portzap` user <br>

* portzap unapply <br>
Clear portzap rules from security.mac.do.rules <br>

## Configuration

#### Superuser

After installation is complete the portzap environment should be setup.

That includes the creation of the `_portzap` user and group, as well as
the creation of `/home/_portzap`. Adding a user to the `_portzap` group is
recommended when you want to manage the tree as a non-root user (who will
then be delegated to `_portzap`). The process is mostly automated, and the
following commands should be run as a superuser:

* portzap setup <br>
Creates the `_portzap` user and group <br>

* portzap teardown <br>
Tears down the `_portzap` user and group <br>

* pw groupmod _portzap -m `<user>` <br>
Add a user to the `_portzap` group. <br>

#### mac_do(4)

The
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
policy must be loaded into the kernel before portzap(8)
can use the
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
utility successfully. This can be done in one of two ways, _the
recommended way_ is to add the following line to `/boot/loader.conf`:

    mac_do_load="YES"

And then reboot the system. Otherwise, the policy can be loaded manually
with the following command and without a reboot:

    root@localhost# kldload mac_do

## Install

#### Package

portzap is available
[from the HardenedBSD src tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/portzap).
<br>
"pkg install portzap" should work too but expect slower updates.

#### Source

The first step is to clone the repository. <br>
Afterwards portzap can be installed (and deinstalled) through make.
Run the following as root (or with equivalent privileges):

```sh
git clone https://github.com/0x1eef/portzap
cd portzap
make install
make deinstall
```

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)
* [rsync](https://www.man7.org/linux/man-pages/man1/rsync.1.html)

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/portzap)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/portzap)
* [hardenedbsd.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/portzap)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
