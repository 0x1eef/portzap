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

portzap manages a local copy of the BSD ports tree in a way that is
efficient, scalable, and secure. It provides consistent ownership and
permissions for the ports tree, keeps a clean separation between
root-only operations and unprivileged operations, and offers a simple
clone, pull, and install workflow.

Every `portzap` command can be run as root. For the commands that
touch the git ports tree, portzap drops privileges to the dedicated
`_portzap` user, so git never runs with elevated privileges.

The default ports tree is HardenedBSD, but portzap works with any
git URL. The same workflow can manage the
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

### Setup

<details>
<summary>First-time setup</summary>
<br>

The mac_do(4) policy must be loaded before portzap can use
mdo(1). Add it to `/boot/loader.conf` and reboot, or load it
manually without a reboot:

```sh
##
# Permanent
sysrc -f /boot/loader.conf mac_do_load="YES"

##
# Temporary (no reboot)
kldload mac_do
```

Then create the `_portzap` user and group:

```sh
portzap setup
```

Run `portzap teardown` later to reverse this step. Both commands
require root.

Add yourself to the `_portzap` group only if you want to run
`clone`, `pull`, or `sh` without root. When those commands are run
as root, portzap drops privileges to `_portzap` automatically:

```sh
pw groupmod _portzap -m <user>
```

Enable and start the rc.d service that applies the mac_do(4) rules:

```sh
sysrc portzap_enable="YES"
service portzap start
```

</details>

### Commands

All `portzap` commands can be run as root. The commands that touch
the git ports tree (`clone`, `pull`, and `sh`) are delegated to the
`_portzap` user through
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1), so
root drops privileges before running anything inside
`/home/_portzap/ports/`. Members of the `_portzap` group can run
the same delegated commands without root. Everything else is root-only,
except `status`, which any user can run.

#### Delegated

<details>
<summary>clone</summary>
<br>

Clone the ports tree into `/home/_portzap/ports/` as the `_portzap`
user. The repository URL comes from `PORTZAP_CLONEURL`, which
defaults to the official HardenedBSD radicle repository.

```sh
portzap clone
```

</details>

<details>
<summary>pull</summary>
<br>

Pull updates into `/home/_portzap/ports/` as the `_portzap` user.
The current branch is pulled from its upstream remote without
rebasing.

```sh
portzap pull
```

</details>

<details>
<summary>sh</summary>
<br>

Run `/bin/sh` inside `/home/_portzap/ports/` as the `_portzap` user.
Use this instead of editing or running git commands in the ports tree
as root.

```sh
portzap sh
```

</details>

#### Root-only

<details>
<summary>install</summary>
<br>

Install `/home/_portzap/ports/` into `/usr/ports/` with rsync. The
install is skipped when `/usr/ports/` already matches the current
ports commit; pass `-f` to force it.

```sh
portzap install
portzap install -f
```

</details>

<details>
<summary>rm</summary>
<br>

Interactively remove the contents of `/usr/ports/` and/or
`/home/_portzap/ports/`. This command requires root.

```sh
portzap rm
```

</details>

<details>
<summary>apply / unapply</summary>
<br>

Apply or remove the portzap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules. Both commands require root.

```sh
portzap apply
portzap unapply
```

</details>

#### Anyone

<details>
<summary>status</summary>
<br>

Show whether the portzap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules are applied. This command can be run by any user.

```sh
portzap status
```

</details>

#### FreeBSD

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

## Configuration

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

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://git-scm.com/)
* [rsync](https://rsync.samba.org/)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
