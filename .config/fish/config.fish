# Configuration for virtualfish
 
# system
set -x LD_LIBRARY_PATH "/usr/local/lib"

# variables
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_DIRS $XDG_DATA_DIRS:/var/lib/snapd/desktop

## virtualfish
set -x VIRTUALFISH_DEFAULT_PYTHON "/usr/bin/python3"
set -x VIRTUALFISH_HOME "$XDG_CONFIG_HOME/virtualenvs"
set -x PROJECT_HOME "$HOME/Projects"

## taskwarrior
set -x TASKRC "$XDG_CONFIG_HOME/task/taskrc"
set -x TASKDATA "$XDG_CONFIG_HOME/task/task"
set -x VIT_DIR "$XDG_CONFIG_HOME/vit"

## other
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x EMAIL "mail@codyjohnson.xyz"
set -x MATLAB_SHELL "/usr/bin/bash"
set -x TEXMFHOME $XDG_CONFIG_HOME/texlive/texmf

set -x FZF_DEFAULT_OPTS "--height 40% --layout=reverse"
set -x FZF_CTRL_T_OPTS '--preview "bat --style=numbers --color=always {} 2> /dev/null | head -500"'

set -x FZF_FIND_FILE_OPS '--preview "bat --style=numbers --color=always {} 2> /dev/null | head -500"'
#set -x FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always"

# custom home for fisher
set -g fisher_path $XDG_CONFIG_HOME/fisher_packages
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
      builtin source $file 2> /dev/null
end


# key bindings
bind \es fpass
bind -M insert \es fpass
bind \ef source_conf
bind -M insert \ef source_conf
bind \eb broot
bind -M insert \eb broot
bind \er ranger
bind -M insert \er ranger
bind \ei fish_vi_key_bindings
bind -M insert \ed fish_default_key_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -d ~/.mambaforge
  eval /home/cody/.mambaforge/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

