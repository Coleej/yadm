import os
from pathlib import Path

from IPython.terminal.prompts import Prompts, Token


def abbreviate_prompt():
    sep = os.sep
    cwd = Path.cwd()
    parts = cwd.parts
    first_letters = [part[0] for part in parts]
    head = parts[-1]

    if str(Path.home()) in str(cwd):
        root = "~"
        middle = sep.join(first_letters[3:-1])
        if len(first_letters[3:]) == 0:
            path_rep = root
        elif len(first_letters[3:]) == 1:
            path_rep = root + sep + head
        else:
            path_rep = root + sep + middle + sep + head
        pass
    elif "/mnt/c/Users/JOH99357" in str(cwd):
        root = "~"
        middle = sep.join(first_letters[5:-1])
        if len(first_letters[5:]) == 0:
            path_rep = root
        elif len(first_letters[5:]) == 1:
            path_rep = root + sep + head
        else:
            path_rep = root + sep + middle + sep + head
        pass
    else:
        root = parts[0]
        middle = sep.join(first_letters[1:-1])
        if len(middle) == 0:
            path_rep = root + head
        else:
            path_rep = root + middle + sep + head
        pass

    return path_rep


class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token.Prompt, abbreviate_prompt()),
            (Token.Prompt, " ["),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, "] >>> "),
        ]

    def out_prompt_tokens(self, cli=None):
        return [
            (Token.OutPrompt, abbreviate_prompt()),
            (Token.OutPrompt, " ["),
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPrompt, "] >>> "),
        ]


get_ipython().prompts = MyPrompt(get_ipython())
