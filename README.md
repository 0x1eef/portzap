## About

portzap is a utility for staying up to date with the
HardenedBSD ports tree. It's designed to make it easy
for unprivileged users who are members of the `_portzap`
group to create and update a transient copy of the ports
tree, which can then be installed into the `/usr/ports/`
directory by the root user.

Once the initial installation is done, future updates are
incremental, which means that portzap will only add, remove or
update ports that have changed since the last update.

## Usage

* `portzap clone` <br>
  Clones HardenedBSD's ports tree into `/home/_portzap/ports/`.

* `portzap pull` <br>
  Pulls updates into `/home/_portzap/ports/`.

* `portzap install` <br>
  Installs `/home/_portzap/ports/` into `/usr/ports/`. <br>
  After the first installation, future installations try to save time
  by being incremental. Must be run by the root user.

## Install

Git installation:

```
git clone https://git.hardenedbsd.org/0x1eef/portzap.git
cd portzap
cp -R bin /usr/local/
cp -R libexec /usr/local/
```

## Sources

* [Source code (git.hardenedbsd.org)](https://git.hardenedbsd.org/0x1eef/portzap)
* [Source code (GitHub)](https://github.com/0x1eef/portzap)
* [Source code (GitLab)](https://gitlab.com/0x1eef/portzap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
