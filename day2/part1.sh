#!/bin/sh


mkdir out; cd out ; split -l 1 ../input.txt iiiii && perl -i'' -pe 's/(\w)(?!$)/$1\n/g' iiiii* && ls iiiii* | xargs -P10 -I@ /bin/sh -c 'sort @ | uniq -c > ooooo-@' && echo checksum $(( $(grep -l 2 ooooo* | wc -l) * $(grep -l 3 ooooo* | wc -l) ))
