## About

The portzap utility manages a local copy of the
[hardenedbsd ports collection](https://git.hardenedbsd.org/hardenedbsd/ports).
The utility can clone the ports collection, pull updates, and finally install
the ports collection (typically to `/usr/ports/`).

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
    # Defaults to https://github.com/hardenedbsd/ports.git
    export PORTZAP_PORTS_URL=https://git.hardenedbsd.org/hardenedbsd/ports.git

    # The directory where the ports collection will be installed
    # Defaults to "/usr/ports/"
    export PORTZAP_PORTS_DIR=/path/to/ports

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

* [Source code (git.hardenedbsd.org)](https://git.hardenedbsd.org/0x1eef/portzap)
* [Source code (GitHub)](https://github.com/0x1eef/portzap)
* [Source code (GitLab)](https://gitlab.com/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
