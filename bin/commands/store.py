import click
from bin.libs.entity import DotFileEntity
from bin.libs import fs

class StoreCommand():
    def __init__(self, filepath, topicname):
        self.dotfile = DotFileEntity(
            filepath=filepath,
            topicname=topicname
        )

    def execute(self):
        click.echo(f'[INFO] Store ― save dotfile config')
        click.echo(f'[INFO] File: {self.dotfile.homeFilePath}')
        click.echo(f'[INFO] Destination: {self.dotfile.topicFilePath}')
        self.move(self.dotfile)
        self.symlink(self.dotfile)

    def move(self, dotfile: DotFileEntity):
        if not fs.is_directory(dotfile.topicDirPath):
            text = f'[INFO] The following directories do not exist:\n'
            text += f'"{dotfile.topicDirPath}"\n'
            text += f'\nDo you want to create all directories?'
            can_mkdir = click.confirm(text=text, default=True)
            fs.mkdir(dotfile.topicDirPath) if can_mkdir else None
        click.echo(
            f'[INFO] Moving {dotfile.fileBaseName} to {dotfile.topicName}')
        fs.move(dotfile.homeFilePath, dotfile.topicFilePath)

    def symlink(self, dotfile: DotFileEntity):
        text = f'[INFO] The following directories want to create symlink:\n'
        text += f'"{dotfile.fileBaseName}"\n'
        text += f'\nDo you want to create all symlinks?'
        can_symlink = click.confirm(text=text, default=True)
        if can_symlink:
            fs.create_symlink(dotfile.topicFilePath, dotfile.homeFilePath)
        click.echo(f'[INFO] Createing Symlink of {dotfile.fileBaseName}')
