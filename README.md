## About

portzap is designed to allow unprivileged users who are members
of the `_portzap` group to create and update a transient copy of
the HardenedBSD ports tree, which can then be installed into the
`/usr/ports/` directory by root.  Once the initial installation
is complete, future updates are incremental, which means that portzap
will only add, remove or update ports that have changed since the last
update.

## Usage

**Commands**

* __portzap clone__ <br>
  Clones the ports tree into `/home/_portzap/ports/`.

* __portzap pull__ <br>
  Pulls updates into `/home/_portzap/ports/`.

* __portzap install__ <br>
  Installs `/home/_portzap/ports/` into `/usr/ports/`. <br>

**Environment variables**

* __$PORTZAP_PORTS_URL__ <br>
  The URL of a git repository. <br>
  Defaults to https://git.hardenedbsd.org/hardenedbsd/ports.git.

## Install

portzap can be installed through git, or via a port. <br>

* Port: see [0x1eef/ports/freebsd/hardenedbsd/portzap](https://git.hardenedbsd.org/0x1eef/ports/-/tree/main/freebsd/hardenedbsd/portzap).

* Git: <br>

```
$ git clone https://git.hardenedbsd.org/0x1eef/portzap.git
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
