#!/usr/bin/env python

from distutils.core import setup

setup(
    name='Oximon',
    version='0.0.2',
    description='Record data from pulse oximeters',
    author='Vincent Ollivier',
    author_email='contact@vincentollivier.com',
    url='http://vinc.cc/projects/oximon',
    license='GPL',
    packages=['oximon'],
    scripts=['bin/oximon']
)
