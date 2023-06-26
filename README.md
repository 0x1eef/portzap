## About

The portzap utility manages a local copy of the
[HardenedBSD ports tree](https://git.hardenedbsd.org/hardenedbsd/ports).
The utility allows user accounts with `_portzap`
group membership to create and update a transient
copy of the ports tree, which can then be installed
into the `/usr/ports/` directory by root.

After the first installation of `/usr/ports`, future updates
are incremental - which means that portzap will only add,
remove or update ports that have changed since the last
update.

## Examples

**Usage**

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

* __$PORTZAP_PORTS_DIR__ <br>
  The directory where the ports collection will be installed. <br>
  Defaults to `/usr/ports/`.

## Install

**Port**

See [0x1eef/ports/freebsd/hardenedbsd/portzap](https://github.com/0x1eef/ports/tree/main/freebsd/hardenedbsd/portzap).

**Source**

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
