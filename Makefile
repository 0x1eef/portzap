PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/portzap
SHAREDIR = $(PREFIX)/share/portzap

install:
	@find bin/ libexec/ share/ man/ -type d -exec install -d $(PREFIX)/"{}" \;
	@find bin/ libexec/ -type f -exec install -m 0755 "{}" $(PREFIX)/"{}" \;
	@find share/ man/ -type f -exec install -m 0644 "{}" $(PREFIX)/"{}" \;

deinstall:
	rm -rf $(BINDIR)/portzap
	rm -rf $(MANDIR)/portzap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	find bin/ libexec/ -type f -exec shellcheck -x "{}" \;
