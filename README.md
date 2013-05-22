Oximon
======

Oximon is a very simple command line tool to record data from pulse oximeters.
It has been tested with a CMS-50E but should work with any CMS-50x. The textual
output of Oximon can then be used by `gnuplot` to produce graphical
visualisation.

![gnuplot sample result](/img/gnuplot.png?raw=true)


Installation
------------

Oximon is dependent on `pySerial` for communicating with the pulse oximeter by
USB.

To install Oximon from source:

    $ git clone git://github.com/vinc/oximon.git
    $ cd oximon
    $ sudo python setup.py install


Usage
-----

To use Oximon, run it from the command line with the correct serial port:

    $ oximon --port /dev/ttyUSB0 
    #date   heart rate  oxygen saturation
    2012-01-03 07:22:14.951777  54  97
    2012-01-03 07:22:15.499333  54  97
    2012-01-03 07:22:16.534203  54  97
    2012-01-03 07:22:17.870198  54  97
    2012-01-03 07:22:19.073182  54  97
    2012-01-03 07:22:20.392127  54  97

Helper scripts are provided in `./scripts` for recording a session and
generating a graphical visualization with `gnuplot`.


Dependencies
------------

* [argparse](http://docs.python.org/library/argparse.html)
* [pySerial](http://pyserial.sourceforge.net/)


License
-------

Copyright (C) 2011-2013 Vincent Ollivier. Released under GNU GPL License v3.
