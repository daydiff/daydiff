#!/bin/bash

NUM=$(($2*3))
echo $NUM
POSTS=$( cat $1 | tr '\n' '\t' )
cat README.md | tr '\n' '\t' | sed -E "s#(<\!--blog:start-->).*(<\!--blog:end-->)#\1\t${POSTS}\2#g" | tr '\t' '\n' > README.tmp
mv README.tmp README.md
rm -f rss.xml posts.md
