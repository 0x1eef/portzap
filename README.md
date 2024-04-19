## About

portzap is a utility that manages a local copy of the
[hardenedbsd ports tree](https://git.hardenedbsd.org/hardenedbsd/ports).
The copy of the ports tree is maintained by members of
the `_portzap` group, and the copy of the ports tree
can be installed to `/usr/ports` by root.


## Examples

**CLI**

    # Clone the hardenedbsd ports tree into /home/_portzap/ports/.
    # This command is delegated to the '_portzap' user.
    $ portzap clone

    # Pull updates into /home/_portzap/ports/.
    # This command is delegated to the '_portzap' user.
    $ portzap pull

    # Start over: erase /usr/ports/ and /home/_portzap/ports/.
    # This command is delegated to the '_portzap' user.
    $ portzap erase

    # Install /home/_portzap/ports/ into /usr/ports/.
    # This command requires root privileges.
    # portzap install

    # Add the portzap user, group and home directory.
    # This command requires root privileges.
    # portzap setup

**ENVIRONMENT**

* __$PORTZAP\_GITURL__ <br>
  The URL to a git repository.  <br>
  Default: https://git.hardenedbsd.org/hardenedbsd/ports.git.

* __$PORTZAP\_BRANCH__ <br>
  The git branch to clone and pull updates from. <br>
  Default: hardenedbsd/main.

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the ports collection will be installed. <br>
  Default: /usr/ports/.

## Install

**Port**

portzap is available
[as a hardenedbsd port](https://git.hardenedbsd.org/hardenedbsd/ports/-/tree/hardenedbsd/main/hardenedbsd/portzap). <br>
`pkg install portzap` should work too but expect slower updates.

**Source**

The most recent version of portzap can be installed directly
via git:

    $ git clone https://github.com/0x1eef/portzap.git
    $ cd portzap
    # make install
    # portzap setup
    # pw groupmod -n _portzap -m <user>

## Requirements

* [doas](https://man.openbsd.org/doas) (`pkg install doas`)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html) (`pkg install git`)

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.hardenedbsd.org](https://git.hardenedbsd.org/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
