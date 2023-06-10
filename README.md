## About

portzap is a utility that manages a local copy of the
[hardenedbsd ports tree](https://git.hardenedbsd.org/hardenedbsd/ports),

## Examples

**CLI**

    # Clones the ports tree into "/home/_portzap/ports/"
    $ portzap clone

    # Pulls updates into "/home/_portzap/ports/"
    $ portzap pull

    # Installs "/home/_portzap/ports/" into "/usr/ports/"
    # portzap install

**Environment**

    # The URL of a git repository
    # Defaults to https://git.hardenedbsd.org/hardenedbsd/ports.git
    export PORTZAP_PORTS_URL=https://github.com/HardenedBSD/ports

    # The directory where the ports collection will be installed
    # Defaults to "/usr/ports/"
    export PORTZAP_PORTS_DIR=/path/to/ports

* __$PORTZAP_PORTS_DIR__ <br>
  The directory where the ports collection will be installed. <br>
  Defaults to /usr/ports.

## Install

```
$ git clone https://github.com/0x1eef/portzap.git
$ cd portzap
# cp -R bin /usr/local/
# cp -R libexec /usr/local/
# pw useradd -n _portzap \
           -c "portzap utility user" \
           -m \
           -s /sbin/nologin
# pw groupmod -n _portzap -m <user>
```

## Sources

* [GitHub](https://github.com/0x1eef/portzap)
* [GitLab](https://gitlab.com/0x1eef/portzap)
* [git.hardenedbsd.org](https://git.hardenedbsd.org/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
