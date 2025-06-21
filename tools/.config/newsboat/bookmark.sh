#!/bin/sh
# this is a simple example script that demonstrates how bookmarking plugins for newsbeuter are implemented
# (c) 2007 Andreas Krennmair
# (c) 2016 Alexander Batischev

url="$1"
title="$2"
description="$3"
feed_title="$4"

echo -e "- title: ${title}  \n  description: ${description}  \n  feed: ${feed_title}  \n  ${url}" >> ~/.config/newsboat/bookmarks.md
