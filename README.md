<p align="center">
  <a href="https://4.4bsd.dev">
    <img
      src="44bsd.svg"
      width="400"
      height="200"
      border="0"
      alt="a 4.4bsd.dev project"
     >
  </a>
</p>

> [4.4BSD](https://4.4bsd.dev) project.

portzap manages a local copy of the BSD ports tree. It provides
consistent ownership and permissions for the ports tree, keeps a
clean separation between root-only operations and unprivileged operations,
and offers a simple clone, pull, and install workflow.

Every `portzap` command can be run as root. For the commands that
touch the git ports tree, portzap drops privileges to the dedicated
`_portzap` user, so git never runs with elevated privileges. The default
ports tree is HardenedBSD, but portzap works with any git URL. The same
workflow can manage the
[FreeBSD ports tree](https://git.FreeBSD.org/ports.git) by setting
`PORTZAP_CLONEURL`.

## Install

#### pkg(8)

`pkg install portzap` works on HardenedBSD.
<br>
portzap is also available from
[the HardenedBSD ports tree](https://git.hardenedBSD.org/hardenedBSD/ports/-/tree/hardenedBSD/main/hardenedBSD/portzap).

#### git(1)

The first step is to clone the repository. <br>
Afterwards portzap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/4-4BSD/portzap
cd portzap
make install
make deinstall
```

## Quick start

Run as root **or** as a member of the `_portzap` group. <br>
Delegate to the `_portzap` user.

```sh
##
# Run once
# As root
sysrc -f /boot/loader.conf mac_do_load="YES"
sysrc portzap_enable="YES"
kldload mac_do
portzap setup
service portzap start

##
# Everyday usage
# As root / member of _portzap group
# All commands delegated to _portzap user
portzap clone
portzap install
portzap pull

##
# Drop into a shell
# As root / member of the _portzap group
# Run as the _portzap user
portzap sh
```

## Tunables

<details>
<summary>PORTZAP_CLONEURL</summary>
<br>

The git repository URL cloned by `portzap clone`.

Default:

```
https://rad.hardenedbsd.org/z2XrdvALg77ycnuZRXgScb27yb3wM.git
```

</details>

<details>
<summary>PORTZAP_INSTALLDIR</summary>
<br>

The directory where the ports tree is installed by
`portzap install`.

Default:

```
/usr/ports
```

</details>

<details>
<summary>mac_do(4)</summary>
<br>

The
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
policy must be loaded into the kernel before portzap can use
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1).
Add it to `/boot/loader.conf` and reboot:

```
mac_do_load="YES"
```

Or load it manually without a reboot:

```
kldload mac_do
```

</details>

<details>
<summary>rc.d</summary>
<br>

The rc.d script manages the portzap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules:

```sh
sysrc portzap_enable="YES"
service portzap start
```

</details>

<details>
<summary>Managing a different ports tree</summary>
<br>

portzap is not limited to HardenedBSD. Set `PORTZAP_CLONEURL` to
any git repository before running `portzap clone`, and the same
clone, pull, and install workflow applies. Run the commands as root:
`clone` and `pull` drop privileges to `_portzap`, while `install`
stays root-only. For example, to manage the FreeBSD ports tree:

```sh
export PORTZAP_CLONEURL=https://git.FreeBSD.org/ports.git
portzap clone
portzap pull
portzap install
```

The GitHub mirror works too:

```sh
export PORTZAP_CLONEURL=https://github.com/freebsd/freebsd-ports.git
portzap clone
```

When the HardenedBSD-specific branch is not present in the configured
repository, portzap falls back to the repository's default branch.

</details>

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://git-scm.com/)
* [rsync](https://rsync.samba.org/)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
