## About

portzap is a utility for staying up to date with the
[HardenedBSD ports tree](https://hardenedbsd.org).
The utility stores a transient copy of the ports tree in `/home/_portzap/ports/`.
The transient copy can be created, and updated by an unprivileged user account
who is a member of the `_portzap` group. The transient copy can then be installed
into the `/usr/ports` directory by root.

## Usage

* `portzap clone` <br>
  This command clones HardenedBSD's ports tree into `/home/_portzap/ports`.

* `portzap pull` <br>
  This command pulls updates into `/home/_portzap/ports`.

* `portzap install` <br>
  This command should be run as root. <br>
  The command installs `/home/_portzap/ports` into `/usr/ports`.

## Sources

* [Source code (git.hardenedbsd.org)](https://git.hardenedbsd.org/0x1eef/portzap)
* [Source code (GitHub)](https://github.com/0x1eef/portzap)
* [Source code (GitLab)](https://gitlab.com/0x1eef/portzap)
