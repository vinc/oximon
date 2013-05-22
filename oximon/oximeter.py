#!/usr/bin/env python
#
# Copyright (C) 2011-2013 Vincent Ollivier <contact@vincentollivier.com>
#
# This file is part of Oximon.
#
# Oximon is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

from serial import Serial

class Oximeter(object):
    def __init__(self, port):
        self._serial = Serial(port, 19200)
        self._hr = 0
        self._sat = 0

    @property
    def hr(self):
        return self._hr

    @property
    def sat(self):
        return self._sat

    def update(self):
        return False

    def close(self):
        self._serial.close()

    @staticmethod
    def _unpack_byte(s, i):
        b = s[i]
        return b if type(b) is int else ord(b)
