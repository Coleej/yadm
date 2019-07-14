from IPython.terminal.prompts import Prompts, Token

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, os.getcwd()),
                (Token.Prompt, ' - ['),
                (Token.PromptNum, str(self.shell.execution_count)),
                (Token.Prompt, ']: ')]

    def out_prompt_tokens(self, cli=None):
        return [(Token.OutPrompt, os.getcwd()),
                (Token.OutPrompt, ' - ['),
                (Token.OutPromptNum, str(self.shell.execution_count)),
                (Token.OutPrompt, ']: ')]


get_ipython().prompts = MyPrompt(get_ipython())
