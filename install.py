#!/usr/bin/env python3

# get $HERE
# import $LIBS
# print START
# install git-all
# read INPUTS
# link CONFIGS
# set SETTINGS
# print END

import click
import subprocess

from bin.commands.install import InstallCommand

@click.command(help='― Installing with Package Name')
@click.option('--pkg', '-p', prompt='Enter package name ')
def install(pkg: str):
    InstallCommand(pkg).execute()


if __name__ == '__main__':
    install()
