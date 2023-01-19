## About

portzap is a simple bourne shell script that takes care of keeping up to
date with the [HardenedBSD](https://hardenedbsd.org) ports collection.

The
[HardenedBSD ports collection](https://git.hardenedbsd.org/hardenedbsd/ports.git)
is maintained as a git repository, and portzap allows the repository to be cloned
(and updated) using a regular user account. The unpacking of the repository to
`/usr/ports` is also supported but must be performed by root.

## Usage

* **portzap init** <br>
  This command should be run as root. <br>
  The command creates the `_portzap` user / group, and the directory `/home/_portzap`.

* **portzap clone** <br>
  This command should be run by a user account that is a member of the `_portzap` group. <br>
  The command clones HardenedBSD's ports collection to `/home/_portzap/ports`.

* **portzap pull** <br>
  This command should be run by a user account that is a member of the `_portzap` group. <br>
  The command updates an existing repository previously cloned with `portzap clone`.

* **portzap install** <br>
  This command should be run as root. <br>
  The command installs `/home/_portzap/ports` into `/usr/ports`.

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/portzap)
* [Source code (GitLab)](https://gitlab.com/0x1eef/portzap)
