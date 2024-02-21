import click
import subprocess


class InstallCommand():
    def __init__(self, pkg):
        self.pkg = pkg

    def execute(self):
        try:
            click.echo(f'― {self.pkg} Installing...')
            cmd = ['sudo', 'apt', 'install', '-y', f'{self.pkg}']
            subprocess.run(cmd, check=True)
            click.echo(f"― {self.pkg} has been successfully installed!")
        except subprocess.CalledProcessError:
            click.echo(f"― {self.pkg} package failed to fetch!")


def install_packages(packages):
    for package in packages:
        InstallCommand(package).execute()


PACKAGE_LIST = [
    'brave',      # open with selenium and give password of pages
                  # install extensions list [infinity-one-tab, ...]
    'code',       # login-github to sync settings
    'ranger',     # symlink configs
    'oh-my-zsh',  # zsh and symlink configs
    'vim',        # symlink configs
    'neovim',     # symlink configs
    'lazyvim',    # symlink configs
    'lazygit',


    'node',     # nvm -> [node, npm, npx]
    'yarn',
    'pnpm',
    'deno',
    'golang',   # golang version manager
    'ruby',     # ruby   version manger
    'python3',  # update
    'lua',      # luaver -> [lua, lua*]
]


"""
https://github.com/LazyVim/LazyVim
https://github.com/neovim/neovim/wiki/Installing-Neovim
https://ohmyz.sh/
https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/
https://brave.com/linux/
https://github.com/moovweb/gvm
https://stackoverflow.com/questions/4760215/running-shell-command-and-capturing-the-output
"""
