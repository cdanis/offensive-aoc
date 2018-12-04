#!/bin/sh

yes "$(cat input.txt)" | perl -ne 'BEGIN {$freq=0; $count{$freq}++;} $freq += $_; die "$freq" if $count{$freq}++'
