PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
LIBEXECDIR = $(PREFIX)/libexec/portzap
MANDIR = $(PREFIX)/man/man8

install:
	install -d $(BINDIR) $(LIBEXECDIR) $(MANDIR)
	install -m 0755 bin/portzap $(BINDIR)
	install -m 0755 libexec/portzap/* $(LIBEXECDIR)
	install -m 0644 man/man8/portzap.8 $(MANDIR)

deinstall:
	rm -rf $(LIBEXECDIR)
	rm -f $(BINDIR)/portzap
	rm -f $(MANDIR)/portzap.8
