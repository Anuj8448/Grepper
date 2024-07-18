#!/bin/sh
#!/bin/sh
# grepper svnhook example by Wireghoul, uses PHP ruleset
REPOSITORY=$1
REVISION=$2
/usr/local/bin/svnlook diff -r $REVISION $REPOSITORY | \
grepper -d php /dev/stdin | \
ansi2html.sh | \
mail -e -s "[grepper report] rev$REVISION - $REPOSITORY" root@domain.com
