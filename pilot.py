import json
import time
from rich.console import Console
from rich.progress import track
from rich.status import Status
from beaupy import select_multiple, prompt
import pyautogui as pilot

# globals
console = Console()

# functions
def load_json(path):
    raw = open(path)
    return json.load(raw)

def parse_choices(json):
    choices = []
    for key in json:
        choices.append(key)
    return choices

def traverse_step(steps):
    for step in steps:
        parse_action(step)


stores = {}

def parse_action(step):
    action = step['action']

    if action == 'prompt':
        action_prompt(step)
    console.log(f'{action}')

def action_prompt(step: dict):
    is_secure = step.get('secure') or False
    message = step['message']
    name = step['name']
    result = prompt(
        message,
        secure=is_secure
    )

    stores = {[name]: result}

def filter_selections(steps, selections):
    filtered = {}
    for k in steps:
        if k in selections:
            filtered[k] = steps[k]
    return filtered

def main():
    steps = load_json('pilot.json')
    choices = parse_choices(steps)

    console.print("Select Available Actions:")
    selected_keys = select_multiple(
        options=choices,
        ticked_indices=[t for t in range(len(choices))]
    )

    filtered_selections = filter_selections(steps, selected_keys)

    for step_key in filtered_selections:
        step_value = filtered_selections[step_key]
        traverse_step(step_value)

    console.log(stores)


if __name__ == "__main__":
    main()
