PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/man/man8
LIBEXECDIR = $(PREFIX)/libexec/portzap
SHAREDIR = $(PREFIX)/share/portzap

install:
	install -d $(BINDIR) $(LIBEXECDIR) $(SHAREDIR) $(MANDIR)
	install -m 0755 bin/portzap $(BINDIR)
	install -m 0755 bin/setup-portzap $(BINDIR)
	install -m 0755 libexec/portzap/* $(LIBEXECDIR)
	install -m 0644 share/portzap/* $(SHAREDIR)
	install -m 0644 man/man8/portzap.8 $(MANDIR)

deinstall:
	rm $(BINDIR)/portzap
	rm $(BINDIR)/setup-portzap
	rm $(MANDIR)/portzap.8
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	shellcheck bin/portzap
	shellcheck libexec/portzap/*
