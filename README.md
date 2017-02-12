<!--
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
-->
# The Cloud9 Web IDE

This is a packaging of <https://github.com/c9/core/>.

## cloud9
After successfully executing any and all init scripts, the container will start cloud9 with any user supplied options.

## docker
This image uses docker-out-of-docker (dood).
It is necessary to use this option `--volume /var/run/docker.sock:/var/run/docker.sock ` necessary for docker

An example usage is `docker run --interactive --tty --volume /var/run/docker.sock:/var/run/docker.sock:ro tidyrailroad/cloud9:5.0.0 --help`