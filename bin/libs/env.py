from os import environ, path, getcwd
from typing import Literal, Tuple, Union, Optional

Keys = Literal['HOME', 'HERE', 'ROOT', 'REPO', 'TOPIC']

def env(key: Optional[Keys] = None) -> Union[str, Tuple[str, str, str, str, str]]:
    ROOT = '/'
    HOME = environ.get('HOME', path.expanduser('~'))
    REPO = environ.get('DOTFILES', path.join(HOME, 'dotfiles'))
    TOPIC = environ.get('TOPIC', path.join(REPO, 'topics'))
    HERE = getcwd()

    if key is None:
        return HERE, TOPIC, REPO, HOME, ROOT

    if key == 'TOPIC':
        return str(TOPIC)
    elif key == 'ROOT':
        return str(ROOT)
    elif key == 'HOME':
        return str(HOME)
    elif key == 'REPO':
        return str(REPO)
    elif key == 'HERE':
        return str(HERE)
    else:
        raise ValueError(f"Invalid environment key: {key}")
