#!/bin/bash
#
# Support script that runs commands in order to install dependencies
# etc in a Docker image that is used to build LyX.

function failed() {
    printf "Command '%s' failed, exiting\n" "$*"
    exit -1
}

function do_or_fail() {
    printf "# Executing: %s\n" "$*"
    "$@" || failed "$@"
}


# Install tools and libraries needed to build LyX
do_or_fail  apt-get --quiet update

do_or_fail  apt-get --quiet --assume-yes install 	\
		texlive-full				\
		imagemagick

do_or_fail  rm -rf /var/lib/apt/lists/*
