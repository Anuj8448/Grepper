grepper
===============================================================================
grepper is a simple script and signature sets that allows you to find potential
security flaws in source code using the GNU utility grep. It's comparable to
other static analysis applications like RATS, SWAAT and flaw-finder while
keeping the technical requirements to a minimum and being very flexible.

Installation
===============================================================================
Installation can be done as a user or globally as root, simply run make with
the userinstall or install argument. It is however recommended to use grepper
directly by cloning the git repository as it includes additional database rules
not included on the distribution files. This also enables you to get updates
between releases. To do this run the following command:

```
git clone https://github.com/Anuj8448/Grepper && chmod +x grepper/grepper && cd grepper
```

You can then add grepper to your path, using the appropriate values for
your preferred shell:
```
echo 'PATH="$HOME/grepper:${PATH:+:${PATH}}"; export PATH;' >> ~/.bashrc
```

If grepper is not in your home directory you may wish to set the GRDIR
environment variable to the signatures directory in your `.bashrc` file.
```
export GRDIR=/path/to/grepper/signatures
```

Usage
===============================================================================
grepper supports several options and tries to follow good shell practices. For
a list of the options you can run grepper -h or see below. The simplest way to
use grepper is;

```
. ~/.bashrc

grepper [opts] /path/to/scan

OPTIONS
  -d <dbname> database to use or /path/to/file.db (uses default if not specified)
  -A scan unwanted and difficult (ALL) files
  -x exclude these files (comma separated list: -x *.js,*.sql)
  -i case in-sensitive scan
  -c <num> number of lines of context to display before and after a match, default is 1

  -v prints version number
  -h prints this help screen
```

You can set default commandline options via the GRARGS environment variable.
This may affect the use of grepper in scripts so it's only recommended to use
the B,L,b,z and Z options for this purpose.
```
echo 'GRARGS="-b -L"; export GRARGS' >> ~/.bashrc
```
