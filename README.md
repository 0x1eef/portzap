## About

portzap is a utility that manages a local copy of the
[hardenedbsd ports tree](https://git.hardenedbsd.org/hardenedbsd/ports).

## Examples

**CLI**

    # Clone the hardenedbsd ports tree into /home/_portzap/ports/.
    # This command is delegated to the '_portzap' user.
    $ portzap clone

    # Pull updates into /home/_portzap/ports/.
    # This command is delegated to the '_portzap' user.
    $ portzap pull

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

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the ports collection will be installed. <br>
  Default: /usr/ports/.

## Install

    $ git clone https://github.com/0x1eef/portzap.git
    $ cd portzap
    # make install
    # portzap setup
    # pw groupmod -n _portzap -m <user>

## Requirements

* [doas](https://man.openbsd.org/doas) <br>
  pkg install doas

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.hardenedbsd.org](https://git.hardenedbsd.org/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
