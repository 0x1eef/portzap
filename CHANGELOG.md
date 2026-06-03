# Changelog

## Unreleased

## v2.4.0

Changes since `v2.3.0`.

This release switches the default ports clone URL from GitHub to the official
hardenedBSD Radicle repository.

### Change

* **Switch default ports clone URL to hardenedBSD Radicle** <br>
  Switch the default ports clone URL from GitHub to the official
  hardenedBSD Radicle repository.

## v2.3.0

Changes since `v2.2.0`.

This release improves `portzap pull` performance by avoiding an unnecessary
`git stash create` process, and adds a force option for installs that should
run even when the current tree is already up to date.

### Add

* **Add force installs** <br>
  Add `-f` to force `portzap install` even when it is already up to
  date.

### Fix

* **Speed up `portzap pull`** <br>
  Avoid spawning `git stash create` during `portzap pull`.

## v2.2.0

Changes since `v2.1.1`.

This release avoids unnecessary install work when the installed commit already
matches the current ports commit.

### Fix

* **Skip rsync for matching commits** <br>
  Skip rsync when the installed commit matches the current ports commit.

## v2.1.1

Changes since `v2.1.0`.

This release fixes mac_do rule handling for multi-rule configurations and
avoids early exits when the `_portzap` user is missing.

### Fix

* **Fix multi-rule filtering in `portzap unapply`** <br>
  Fix rule filtering in `portzap unapply` when multiple rules are
  present.

* **Avoid early exits in mac_do helpers** <br>
  Avoid early exits in mac_do rule helpers when `_portzap` is missing.

## v2.1.0

Changes since `v2.0.0`.

This release adds `portzap unapply` and `portzap status`, installs an rc.d
service for managing mac_do(4) rules, and renames the shared mdo wrapper.

### Add

* **Add `portzap unapply`** <br>
  Add `portzap unapply` to clear portzap rules from
  `security.mac.do.rules`.

* **Add `portzap status`** <br>
  Add `portzap status` to report whether portzap mac_do(4) rules are
  applied.

* **Add an rc.d service** <br>
  Install `etc/rc.d/portzap` to manage mac_do(4) rules.

### Change

* **Rename the shared mdo wrapper** <br>
  Rename `scripts/sh` to `scripts/mdo` and keep it as the shared mdo
  wrapper.

## v2.0.0

Changes since `v1.4.0`.

This release replaces doas delegation with mdo/mac_do, adds
`portzap apply` for managing mac_do rules, and switches installs to rsync for
simpler and more reliable updates.

### Breaking

* **Replace doas with mdo/mac_do** <br>
  Use `mdo` and `mac_do` for delegating unprivileged commands to the
  `_portzap` user.

### Add

* **Add `portzap apply`** <br>
  Add `portzap apply` to apply `security.mac.do.rules` for portzap.

### Change

* **Use rsync for installs** <br>
  Use rsync for installs to simplify updates and improve reliability.

## v1.4.0

Changes since `v1.3.4`.

This release improves update handling by creating merge commits on pull,
including renamed and copied files in update lists, and preserving metadata
during in-place installs.

### Change

* **Create a merge commit on each pull** <br>
  Create a merge commit when pulling from the upstream repository and
  disable rebase.

* **Handle renames and copies in update file lists** <br>
  Include rename and copy detection when computing changed and removed
  paths during in-place updates.

* **Preserve permissions and symlinks on update installs** <br>
  Copy updated files with permissions and symlink metadata preserved
  during in-place updates.

## v1.3.4

Changes since `v1.3.3`.

This release grants members of the `_portzap` group write access to the ports
tree so unprivileged users can build ports from source.

### Change

* **Grant group members write access to the ports tree** <br>
  Grant members of the `_portzap` group write access to both
  `/usr/ports` and `/home/_portzap/ports`.

## v1.3.3

Changes since `v1.3.2`.

This release removes verbose install output from the `Makefile`.

### Change

* **Remove verbose install output** <br>
  Drop the `-v` flag from the `install` command in the `Makefile`.

## v1.3.2

Changes since `v1.3.1`.

This release updates source documentation and comments.

### Change

* **Update source code documentation** <br>
  Update source code documentation and comments.

## v1.3.1

Changes since `v1.3.0`.

This release replaces a `$LOCALBASE` reference with relative path handling and
reimplements the option parser with `getopts`.

### Change

* **Remove `$LOCALBASE` from `bin/portzap`** <br>
  Replace the `$LOCALBASE` reference in `bin/portzap` with a relative
  path.

* **Reimplement option parsing with `getopts`** <br>
  Reimplement the option parser with `getopts` in place of the previous
  custom parser.

## v1.3.0

Changes since `v1.2.1`.

This release improves documentation, switches to relative paths, makes log
messages more consistent, documents `portzap sh`, and removes the obsolete
`portzap checkout` command.

### Breaking

* **Remove `portzap checkout`** <br>
  Remove the `portzap checkout` command. Use `portzap sh` with
  `git checkout <branch>` instead.

### Add

* **Document `portzap sh` in the man page** <br>
  Add `portzap sh` to the `portzap.8` SYNOPSIS section.

### Change

* **Improve `portzap.8`** <br>
  Mention and provide an example of how to add a user to the
  `_portzap` group with `pw groupmod`.

* **Replace `${LOCALBASE}` with relative paths** <br>
  Replace `${LOCALBASE}` with paths relative to
  `$(dirname "${0}")/..`, and collapse `${localbase}` and `${libexec}`
  into a single `${libexec}` variable.

* **Make log messages more consistent** <br>
  Revisit log messages for consistency across `bin/` and `libexec/`.

## v1.2.1

Changes since `v1.2.0`.

This release improves setup behavior, logging, and user creation, and fixes a
typo in the setup command.

### Add

* **Install `doas.conf` when missing** <br>
  Install `/usr/local/etc/doas.conf` with `root:wheel` ownership and
  `u=rw,go=` mode when `${PREFIX}/etc/doas.conf` does not exist.

* **Log successful `portzap rm` completion** <br>
  Log when `portzap rm` completes successfully, matching other
  commands.

### Fix

* **Fix typo in `portzap setup`** <br>
  Fix a typo in `commands/portzap-setup` that caused an error when
  running `portzap setup`.

### Change

* **Format log messages with the program name** <br>
  Format messages written to standard output and standard error as
  `portzap: <message>`.

* **Replace chmod with the `pw useradd -M` switch** <br>
  Replace chmod with the `-M` switch passed to `pw useradd` in the
  `setup-user` script.

## v1.2.0

Changes since `v1.1.0`.

This release fixes setup-doas behavior and simplifies the script layout by
collapsing setup and utility scripts under `libexec/portzap/scripts`.

### Add

* **Add `libexec/portzap/scripts/setup`** <br>
  Add `libexec/portzap/scripts/setup` to replace the former
  `libexec/portzap/setup` directory.

* **Add `libexec/portzap/scripts`** <br>
  Add `libexec/portzap/scripts` to replace the former
  `libexec/portzap/utils` directory.

### Fix

* **Fix `setup-doas` hang** <br>
  Fix a bug in `setup-doas` that could hang `portzap setup`.

### Change

* **Collapse script directories** <br>
  Stop organizing script directories beyond `libexec/portzap/scripts`.

## v1.1.0

Changes since `v1.0.0`.

This release adds a shared umask helper, breaks install logic into smaller
files, improves setup-doas behavior, adds setup and teardown commands, and
adds `portzap sh`.

### Add

* **Add a shared umask helper** <br>
  Add `libexec/portzap/utils/get-umask` as a single source of truth for
  the mask given to umask by git and `portzap-install`.

* **Split `portzap-install` into multiple files** <br>
  Add `libexec/portzap/utils/install/` with files that cover both fresh
  installs and updates.

* **Improve `setup-doas`** <br>
  Improve `setup/setup-doas` behavior so it is more likely to do what
  is expected.

* **Add setup and teardown commands** <br>
  Add `portzap setup` and `portzap teardown` to replace and enhance
  `setup-portzap`.

* **Add `portzap sh`** <br>
  Add `libexec/portzap/commands/portzap-sh`, a command that can run
  `/bin/sh` within `/home/_portzap/src/` as the `_portzap` user.

## v1.0.0

This release adds the initial portzap user setup flow and improves recovery
from clone checkout failures.

### Add

* **Add user setup** <br>
  Add `libexec/portzap/setup/setup-user` to set up the portzap user
  environment.

### Fix

* **Recover from checkout failure** <br>
  Recover gracefully from `git checkout` failure in `portzap-clone`.

## v0.2.1

Changes since `v0.2.0`.

This release fixes temporary staging directory builds.

### Fix

* **Fix the `Makefile` mandoc install path** <br>
  Fix `Makefile` directory creation for mandoc files when building the
  port into a temporary staging directory.

## v0.2.0

This release refactors git helper scripts and reduces noisy command output.

### Add

* **Add git helper scripts** <br>
  Add `utils/git`, a dedicated directory for git-related scripts.

### Change

* **Remove the git-diff rename limit** <br>
  Remove the file rename limit from git-diff.

* **Replace `utils/gitexec` with `utils/git/run`** <br>
  Communicate with git through `utils/git/run`.

* **Remove shell tracing output** <br>
  Remove `set -x` to emit less output.

* **Remove old scripts** <br>
  Remove `utils/printok`, `utils/printerr`, and `utils/git-rev`.
