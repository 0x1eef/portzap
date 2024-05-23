## About

portzap is a utility that manages a local copy of the
[HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports).
The copy of the ports tree is maintained by members of
the `_portzap` group, and the copy of the ports tree
can be installed into `/usr/ports/` by root.

## Examples

#### CLI: setup-portzap

This command should be run after installing portzap for
the first time:

    # Add the '_portzap' user, group and home directory
    # This command requires root privileges
    root@localhost# setup-portzap

#### CLI: portzap

    # Clone the HardenedBSD ports tree into /home/_portzap/ports/
    # This command is delegated to the '_portzap' user
    user@localhost$ portzap clone

    # Pull updates into /home/_portzap/ports/
    # This command is delegated to the '_portzap' user
    user@localhost$ portzap pull

    # Checkout a branch other than the default: hardenedbsd/main
    # This command is delegated to the '_portzap' user
    user@localhost$ portzap checkout freebsd/main

    # Install /home/_portzap/ports/ into /usr/ports/
    # This command requires root privileges
    root@localhost# portzap install

    # Remove the contents of /usr/ports/ and /home/_portzap/ports/
    # This command requires root privileges
    root@localhost# portzap rm

#### Environment

* __$PORTZAP\_GITURL__ <br>
  The URL to a git repository <br>
  Default: https://git.HardenedBSD.org/HardenedBSD/ports.git

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the ports collection will be installed <br>
  Default: /usr/ports/

## Install

**Port**

portzap is available
[as a HardenedBSD port](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/portzap). <br>
`pkg install portzap` should work too but expect slower updates.

**Source**

The most recent version of portzap can be installed directly
via git:

    user@localhost$ git clone https://github.com/0x1eef/portzap.git
    user@localhost$ cd portzap
    root@localhost# doas -u root make install
    root@localhost# setup-portzap
    root@localhost# pw groupmod -n _portzap -m <user>

## Requirements

* [doas](https://man.openbsd.org/doas) (`pkg install doas`)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html) (`pkg install git`)

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.HardenedBSD.org](https://git.HardenedBSD.org/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
