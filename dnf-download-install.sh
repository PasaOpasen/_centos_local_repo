#!/bin/bash

packages="$@"

cd /repo
dnf install -y $packages
dnf download --resolve --alldeps --arch="x86_64,noarch" $packages
