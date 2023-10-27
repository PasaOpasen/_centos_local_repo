#!/bin/bash

packages="$@"

cd /repo
dnf install -y $packages
dnf download --resolve --alldeps $packages
