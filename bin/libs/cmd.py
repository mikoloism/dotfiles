import os
import shutil
import subprocess


def is_command_exist(cmd: str) -> bool:
    return shutil.which(cmd=cmd) is not None

def execute(cmd: str):
    return subprocess.run(cmd.split(' '), stdout=subprocess.PIPE).stdout.decode('utf-8')

def title(text: str):
    columns = shutil.get_terminal_size().columns
    padding_size = (columns - (len(text) + 5)) // 2
    output = f'=== {text} {"=" * padding_size}'
    print(output)
    return output

def install(pkg: str):
    proc = subprocess.Popen(f'apt-get install -y {pkg}',
                            shell=True,
                            stdin=None,
                            stdout=open(os.devnull, "wb"),
                            stderr=subprocess.STDOUT,
                            executable="/bin/bash"
                            )
    proc.wait()
