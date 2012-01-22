Oximon
======

Oximon is a simple tool to record data from pulse oximeters. It has been
tested with CMS-50E but should work with all the CMS-50x.

Installation
------------

Installing from source:

    git clone git://github.com/vinc/oximon.git
    cd oximon
    python setup.py install

Usage
-----

To use Oximon, run it with the correct serial port:

    $ oximon --port /dev/ttyUSB0 
    #date   heart rate  oxygen saturation
    2012-01-03 07:22:14.951777  54  97
    2012-01-03 07:22:15.499333  54  97
    2012-01-03 07:22:16.534203  54  97
    2012-01-03 07:22:17.870198  54  97
    2012-01-03 07:22:19.073182  54  97
    2012-01-03 07:22:20.392127  54  97

An helper script for recording a session and building a graph with gnuplot
is available on `/scripts`.

Dependencies
------------

* [argparse](http://docs.python.org/library/argparse.html)
* [pySerial](http://pyserial.sourceforge.net/)
