CC      ?= cc
CFLAGS  ?= -O2
PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share
MANDIR  ?= $(DATADIR)/man/man1
EXTRA_CFLAGS = -Wall -Wextra

OBJS = backupfile.o inp.o mkpath.o patch.o pch.o util.o strtonum.o

PROGRAM = patch
INSTALL_NAME ?= $(PROGRAM)

.PHONY: clean

all: $(PROGRAM)

.c.o:
	$(CC) -c -o $@ $< $(EXTRA_CFLAGS) $(CFLAGS)

$(PROGRAM): $(OBJS)
	$(CC) $(EXTRA_CFLAGS) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $(PROGRAM)

clean:
	rm -f $(OBJS) $(PROGRAM)

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 $(PROGRAM) $(DESTDIR)$(BINDIR)/$(INSTALL_NAME)
	install -d $(DESTDIR)$(MANDIR)
	install -m 644 $(PROGRAM).1 $(DESTDIR)$(MANDIR)/$(INSTALL_NAME).1
