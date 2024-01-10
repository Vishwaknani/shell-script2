#!/bin/bash

set -e

ls -ltr

touch example.txt

echo "before wrong commnd"
lsdd

echo "afer worng commnd"

cd /tmp

cd /tmp/centos