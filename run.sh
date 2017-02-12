#!/bin/sh
# Copyright © (C) 2017 Emory Merryman <emory.merryman@gmail.com>
#   This file is part of cloud9.
#
#   cloud9 is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   cloud9 is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with cloud9.  If not, see <http://www.gnu.org/licenses/>.

dnf update --assumeyes &&
    dnf install --assumeyes git make python tar which bzip2 ncurses gmp-devel mpfr-devel libmpc-devel glibc-devel flex bison glibc-static zlib-devel gcc gcc-c++ nodejs &&
    mkdir /opt/cloud9/c9sdk &&
    git -C /opt/cloud9/c9sdk init &&
    git -C /opt/cloud9/c9sdk remote add origin git://github.com/alienbalcony/core.git &&
    git -C /opt/cloud9/c9sdk fetch origin 20170212:impl &&
    git -C /opt/cloud9/c9sdk checkout impl &&
    /opt/cloud9/c9sdk/scripts/install-sdk.sh &&
    curl -L https://raw.githubusercontent.com/alienbalcony/install/20170212/install.sh | bash &&
    cp /opt/cloud9/docker.repo /etc/yum.repos.d/ &&
    dnf install --assumeyes docker-engine &&
    dnf install --assumeyes util-linux-user &&
    dnf update --assumeyes &&
    dnf clean all &&
    true
