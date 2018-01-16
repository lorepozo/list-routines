#!/usr/bin/env python

from setuptools import setup, find_packages


setup(
    name='listroutines',
    version='1.0.0',
    description='listroutines is a driver for using the interactive dataset for program learning of list functions',
    author='Lucas E. Morales',
    author_email='lucas@lucasem.com',
    classifiers=[
            'Programming Language :: Python :: 3.6',
        ],
    packages=find_packages(),
    install_requires = ['requests'],
)