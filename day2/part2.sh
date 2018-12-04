#!/bin/sh

cd out; for AAA in iiiii* ; do ls iiiii* | perl -pe "last if \$_ ge \"$AAA\"" | grep -v $AAA | xargs -P20 -I@ /bin/sh -c "(/bin/echo -ne $AAA @ \\\t ; diff $AAA @ | wc -l) > diffs-$AAA-@" ; done; DIFFCMD=$(cat diffs* | awk '$3 == 4 { print "diff " $1 " " $2 }' | head -n1); AAA=$(echo $DIFFCMD | awk '{print $2}'); LINENUM=$(/bin/sh -c "$DIFFCMD" | head -n1 | cut -dc -f1); sed -e "${LINENUM}d" $AAA | tr -d '\n' ; echo
