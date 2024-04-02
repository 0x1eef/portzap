## About

portzap is a utility that manages a local copy of the
[hardenedbsd ports tree](https://git.hardenedbsd.org/hardenedbsd/ports),

## Examples

**CLI**

    # Clone the hardenedbsd ports tree into /home/_portzap/ports/.
    $ portzap clone

    # Pull updates into /home/_portzap/ports/.
    $ portzap pull

    # Install /home/_portzap/ports/ into /usr/ports/.
    # portzap install

    # Add the portzap user, group and home directory.
    # portzap adduser

**ENVIRONMENT VARIABLES**

* __$PORTZAP\_GITURL__ <br>
  The URL to a git repository.  Default:
  https://git.hardenedbsd.org/hardenedbsd/ports.git

* __$PORTZAP\_INSTALLDIR__ <br>
  The directory where the ports collection will be
  installed. Default: /usr/ports/.

## Install

```
$ git clone https://github.com/0x1eef/portzap.git
$ cd portzap
# cp -R bin /usr/local/
# cp -R libexec /usr/local/
# pw adduser
# pw groupmod -n _portzap -m <user>
```

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.hardenedbsd.org](https://git.hardenedbsd.org/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
