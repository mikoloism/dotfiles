import os
import shutil


def is_exists(path):
    return os.path.exists(path=path)

def is_file(path):
    return os.path.isfile(path=path)

def is_symlink(path):
    return os.path.islink(path=path)

def is_directory(path):
    return os.path.isdir(s=path)

def create_symlink(source, dest, force=True):
    if force == True and is_exists(path=dest):
        os.remove(path=dest)
    return os.symlink(src=source, dst=dest)

def remove(filepath):
    return os.remove(path=filepath)

def move(source, dest):
    return shutil.move(src=source, dst=dest)

def copy(source, dest):
    return shutil.copy(src=source, dst=dest)

def mkdir(path):
    return os.makedirs(name=path, exist_ok=False, mode=511)

def join(*paths):
    return os.path.join(*paths)

def basename(path):
    return os.path.basename(p=path)

def dirname(path):
    return os.path.dirname(p=path)

class PathEntity():
    def __init__(self, path):
        self.dirname = dirname(path)
        self.baseanme = basename(path)
        self.path = join(self.dirname, self.baseanme)

def depath(path):
    return PathEntity(path)
