#!/bin/bash

set -e

ESC="$(printf '\033')"
RST="$ESC[0m"
GRN="$ESC[37;42m"
RED="$ESC[37;41m"

time proverif $@ \
    | sed "s/\(is true\)/$GRN\1$RST/" \
    | sed "s/\(cannot be proved\|is false\)/$RED\1$RST/" \
    | grep --color RESULT
