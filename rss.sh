#!/bin/bash

rssgetnext () {
   local IFS='>'
   read -d '<' TAG VALUE
}

cat $1 | while rssgetnext ; do
   case $TAG in
      'item')
         title=''
         link=''
         pubDate=''
         ;;
      'title')
         title=$VALUE
         ;;
      'link')
         link=$VALUE
         ;;
      'pubDate')
         pubDate=$( date -d "$VALUE" +'%d/%m/%Y' )
         ;;
      '/item')
         cat<<EOF
<ul><li>$pubDate <a href="$link">$title</a></ul>
EOF
         ;;
   esac
done
