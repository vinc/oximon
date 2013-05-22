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
from oximon.oximeter import Oximeter

class CMS50(Oximeter):
    def __init__(self, port):
        super(CMS50, self).__init__(port)
        self._ctrl = 0

    def _read_ctrl(self):
        ctrl = ord(self._serial.read())
        return ctrl if ctrl > 127 else self._read_ctrl()

    def update(self):
        is_new_pulse = False
        ctrl = self._read_ctrl()
        s = self._serial.read(4)
        #x = self._unpack_byte(s, 0)
        #y = self._unpack_byte(s, 1)
        if (ctrl > self._ctrl + 32):
            is_new_pulse = True
            self._hr = self._unpack_byte(s, 2)
            self._sat = self._unpack_byte(s, 3)
        self._ctrl = ctrl
        return is_new_pulse
