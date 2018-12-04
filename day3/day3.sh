#!/bin/sh

mkdir out; cd out; split -l1 --numeric-suffixes=1 -a4 ../input.txt iiiii-; perl -i'' -ne '($x, $y, $w, $h) = $_ =~ m/ (\d+),(\d+): (\d+)x(\d+)$/; for $xx ($x..($x+$w-1)) { for $yy ($y..($y+$h-1)) { print "$xx,$yy\n" } }' iiiii*; cat iiiii*| sort | uniq -c | awk '$1 != 1 { print $2 }' | sort > two_or_more.out ; wc -l two_or_more.out ; ls iiiii* | xargs -I@ -P10 /bin/bash -c "cmp -s /dev/null <(comm -1 -2 <(sort < @) two_or_more.out)  && echo @"
