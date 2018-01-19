#!/usr/bin/env python

from setuptools import setup


setup(
    name='listroutines',
    version='1.0.0',
    description='listroutines is a driver for using the interactive dataset for program learning of list functions',
    author='Lucas E. Morales',
    author_email='lucas@lucasem.com',
    classifiers=[
            'Programming Language :: Python :: 2.7',
            'Programming Language :: Python :: 3.6',
        ],
    packages=['.'],
    install_requires=['requests'],
)
