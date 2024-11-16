## About

portzap is a utility that manages a local copy of the
[HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports).
The copy of the ports tree is maintained by members of
the `_portzap` group, and the copy of the ports tree
can be installed into `/usr/ports/` by root.

## CLI

### CLI: setup

`portzap setup` should be run after installing portzap for
the first time:

    # Add the '_portzap' user, group and home directory
    # This command requires root privileges
    root@localhost# portzap setup

    # Reverse the changes made by 'portzap setup'
    # This command requires root privileges
    root@localhost# portzap teardown

### CLI: group

The following commands are delegated to the `_portzap` user and
restricted to members of the `_portzap` group:

* **portzap clone** <br>
Clone the HardenedBSD ports tree into `/home/_portzap/ports/` <br>

* **portzap pull** <br>
Pull updates into `/home/_portzap/ports/` <br>

* **portzap checkout** <br>
Checkout a branch other than the default: `hardenedbsd/main` <br>

* **portzap sh** <br>
Run `/bin/sh` within `/home/_portzap/ports/` <br>

### CLI: superuser

The following commands are restricted to root:

* **portzap rm** <br>
Remove the contents of `/usr/ports/` and `/home/_portzap/ports/` <br>

* **portzap install** <br>
Install `/home/_portzap/ports/` into `/usr/ports/` <br>

## Environment

* __$PORTZAP\_CLONEURL__ <br>
  The URL of a git repository <br>
  Default: https://github.com/HardenedBSD/ports

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the ports collection will be installed <br>
  Default: /usr/ports/

## Install

portzap is available
[from the HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/portzap).
`pkg install portzap` should work too but expect slower updates. After installation
of portzap, `portzap setup` should be run as root and one or more users should
be added to the `_portzap` group:

    root@localhost# portzap setup
    root@localhost# pw groupmod -n _portzap -m myuser

## Requirements

* [doas](https://man.openbsd.org/doas)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.HardenedBSD.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/portzap)
* [brew.bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
