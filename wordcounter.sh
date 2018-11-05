#!/usr/bin/env bash
# Counts all the words in all the .docx files in the current directory
# TODO: take a dir parameter, defaulting to current dir if none passed in.
# ASPIRATIONAL TODO: Can I store the .txt versions in memory instead of writing to disk? (better perf this way)

mkdir -p wordcount-temp
cp *.docx wordcount-temp
textutil -convert txt wordcount-temp/*.docx
cat wordcount-temp/*.txt | wc -w
rm -r wordcount-temp