#!/usr/bin/env python3

import click
from bin.commands.store import StoreCommand

@click.group()
def main():
    pass

@main.command(help='― save dotfile config')
@click.option('--file', '-f', prompt='where is file(s) (e.g. ~/.gitconfig)', type=str)
@click.option('--topic', '-t', prompt='where store file (e.g. Git/)', type=str)
def store(file: str, topic: str):
    StoreCommand(filepath=file, topicname=topic).execute()


if __name__ == '__main__':
    try:
        main()
    except Exception as error:
        print(f'Exception -> {error}')
