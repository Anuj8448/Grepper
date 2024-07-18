###
# grepper makefile
###

prefix = /usr
dataroot = $(prefix)/share
datadir = $(dataroot)/grepper
bindir = $(prefix)/bin
SIGNATURES := signatures/actionscript.db signatures/android.db signatures/asp.db signatures/c.db signatures/cobol.db signatures/default.db signatures/dotnet.db signatures/exec.db signatures/fruit.db signatures/go.db signatures/ios.db signatures/java.db signatures/js.db signatures/kotlin.db signatures/nim.db signatures/perl.db signatures/php.db signatures/python.db signatures/ruby.db signatures/scala.db signatures/secrets.db signatures/spsqli.db signatures/sql.db signatures/strings.db signatures/typescript.db signatures/xss.db
DISTFILES := Changelog  grepper  LICENSE  README.md
MANFILES := grepper.1
VERSION=`./grepper -v | cut -d' ' -f 3`
.PHONY : clean install uninstall userinstall test signatures

dist: clean signatures manpages $(DISTFILES) $(MANFILES) test
	cd t && ./git-test.sh
	mkdir -p grepper-$(VERSION)/signatures
	cp -f $(DISTFILES) grepper-$(VERSION)
	cp -f $(MANFILES) grepper-$(VERSION)
	cp -f $(SIGNATURES) grepper-$(VERSION)/signatures
	tar zcf grepper-$(VERSION).tar.gz grepper-$(VERSION)
	zip -9r grepper-$(VERSION).zip grepper-$(VERSION)
	cp -rf t/ grepper-$(VERSION)/
	rm -rf t/test-results/*
	cp grepper.in.1 grepper-$(VERSION)
	cp -r signatures/ grepper-$(VERSION)
	cp -r misc grepper-$(VERSION)
	tar zcf grepper-$(VERSION)_src.tar.gz grepper-$(VERSION)
	rm -r grepper-$(VERSION)

userinstall: $(DISTFILES) test
	mkdir -p ~/.grepper
	cp -f $(SIGNATURES) ~/.grepper
	mkdir -p ~/bin
	cp -f grepper ~/bin

install: manpages $(DISTFILES) $(MANFILES) test
	mkdir -p $(bindir)
	mkdir -p $(datadir)
	cp -f $(SIGNATURES) $(datadir)
	cp -f $(DISTFILES) $(datadir)
	cp -f $(MANFILES) $(datadir)
	mv $(datadir)/grepper $(bindir)/grepper

uninstall:
	rm -f $(bindir)/grepper
	rm -rf $(datadir)

clean:
	rm -f grepper-*.tar.gz grepper-*.zip
	rm -f t/test-results/*
	rm -f grepper.1 grepper.7

test: signatures
	mkdir -p t/test-results
	rm -f t/test-results/*
	cd t && /bin/sh ./runtests.sh
	cd t && /bin/sh ./aggregate-results.sh test-results/*

signatures:
	cat signatures/android/*.db    > signatures/android.db
	cat signatures/asp/*.db        > signatures/asp.db
	cat signatures/c/*.db          > signatures/c.db
	cat signatures/dotnet/*.db     > signatures/dotnet.db
	cat signatures/go/*.db         > signatures/go.db
	cat signatures/java/*.db       > signatures/java.db
	cat signatures/js/*.db         > signatures/js.db
	cat signatures/kotlin/*.db     > signatures/kotlin.db
	cat signatures/nim/*.db        > signatures/nim.db
	cat signatures/perl/*.db       > signatures/perl.db
	cat signatures/php/*.db        > signatures/php.db
	cat signatures/python/*.db     > signatures/python.db
	cat signatures/ruby/*.db       > signatures/ruby.db
	cat signatures/scala/*.db      > signatures/scala.db
	cat signatures/typescript/*.db > signatures/typescript.db
	cat signatures/*/default.db    > signatures/default.db
	cat signatures/*/exec.db       > signatures/exec.db
	cat signatures/*/fruit.db      > signatures/fruit.db
	cat signatures/*/sql.db        > signatures/sql.db
	cat signatures/*/xss.db        > signatures/xss.db

manpages:
	nroff -Tascii -mandoc <grepper.in.1 >/dev/null
	cp -f grepper.in.1 grepper.1
	nroff -Tascii -mandoc <grepper.in.7 >/dev/null
	cp -f grepper.in.7 grepper.7

