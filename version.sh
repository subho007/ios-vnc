#!/bin/bash
git describe --always --tags --match="v[0-9]*" | gsed -e 's@-\([^-]*\)-\([^-]*\)$@+\1.\2@;s@^v@@'
