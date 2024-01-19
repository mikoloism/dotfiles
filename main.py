#!/usr/bin/env python3

import json, subprocess
import click
from rich.console import Console
from rich.status import Status
from beaupy import select_multiple, prompt

# globals
console = Console()
status = Status("Running...", console=console)

# functions
class Installer():
    def __init__(self, dependencies):
        self.dependencies = dependencies
        self.dependency = self.dependencies[0]
        self.is_verbose = False
    
    def set_verbose(self, verbose = False):
        self.is_verbose = verbose

    def install(self, commands, should_open_terminal = False):
        if type(commands) is not list and type(commands) is not str:
            raise Exception("<Installer.install(commands)>\n Accepted: List or Str \n Typeof: " + str(type(commands)))
        
        if type(commands) is str:
            status.start()
            terminal = 'gnome-terminal --'
            # TODO: options[1]
            #     output = subprocess.call([command], shell=True)
            # TODO: options[2]
            #     output = subprocess.run([command], shell=True, capture_output=True, encoding='UTF-8')
            # TODO: options[3]
            process = subprocess.Popen(
                [commands] if should_open_terminal == False else [terminal, commands],
                text=True, shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE)
            output, errors = process.communicate()
            
            if len(errors) > 0:
                for line in errors.splitlines():
                    console.print(f'    | [ERROR] {line}')
            if self.is_verbose == True:
                for line in output.splitlines():
                    console.print(f'    |   {line}')
            status.stop()

        elif type(commands[0]) is dict:
            for command in commands:
                name = command['name']
                status.update(f"  | [yellow]{name}[/yellow]")
                if command['open_new'] is not None:
                    self.install(command['cmd'], command['open_new'])
                else:
                    self.install(command['cmd'])
                console.print(f'    | [cyan]{name}[/cyan]')

        elif type(commands) is list:
            for command in commands:
                self.install(command)

        else:
            raise Exception("Typeof <Installer.install(commands)> Not Accepted!")
def install(dependencies, is_verbose=False):
    installer = Installer(dependencies)
    installer.set_verbose(is_verbose)
    selections_length = len(dependencies)
    for step in range(selections_length):
        dependency = dependencies[step]
        name = dependency['name']
        command = dependency['cmd']
        status.update(f"  >>> [yellow]Running[yellow]")
        console.print(f" - [bold cyan]{name}[/bold cyan]")
        installer.install(command)

class SelectionsFilter():
    def __init__(self):
        pass
    def is_selected(self, dependency):
        return dependency['name'] in self.selections
    def filter(self, dependencies, selections):
        self.selections = selections
        return list(filter(self.is_selected, dependencies))
def filter_selections(dependencies, selections):
    filter = SelectionsFilter()
    return filter.filter(dependencies, selections)

def to_choices(deps):
    choices = []
    for dep in deps:
        choices.append(dep['name'])
    return choices

@click.command()
@click.option("--depsfile",
              help="path of dependencies as json file")
              # default="dependencies.json", show_default=True)
@click.option("--verbose",
              help="print each line of <stdout>",
              default=False)
def main(depsfile, verbose):
    # load dependencies json file
    if depsfile is None:
        depsfile = prompt("Where is <dependencies.json> file path: ")
    raw_dependencies = open(depsfile)
    dependencies = json.load(raw_dependencies)

    # prompt choices
    choices = to_choices(dependencies)
    console.print("Choice Each Essential Dependencies:")
    default_selections = [t for t in range(len(dependencies))]
    selections_choice = select_multiple(options=choices, ticked_indices=default_selections)

    # filter selections
    selections_dependency = filter_selections(dependencies, selections_choice)

    # run installation
    install(selections_dependency, verbose)

if __name__ == '__main__':
    main()