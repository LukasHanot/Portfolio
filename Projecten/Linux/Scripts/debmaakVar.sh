#!/bin/bash
#Creates the variables needed when creating packages

cat >>~/.bashrc <<EOF
DEBEMAIL="lukas.hanot@student.kdg.be"
DEBFULLNAME="Lukas Hanot"
export DEBEMAIL DEBFULLNAME
EOF
