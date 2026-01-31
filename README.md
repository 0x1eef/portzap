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
`_portzap` user via the [mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
command and the [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
policy:

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
Typically called from `/etc/rc.local` at boot time <br>

## Configuration

#### Superuser

After installation is complete the portzap environment should be setup.

That includes the creation of the `_portzap` user and group, as well as
the creation of `/home/_portzap`. A user should also be added to the
`_portzap` group. The process is mostly automated, and the following
commands should be run as a superuser:

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
