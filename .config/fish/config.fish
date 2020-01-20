# Configuration for virtualfish

# variables
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_DIRS $XDG_DATA_DIRS:/var/lib/snapd/desktop
set -x VIRTUALFISH_DEFAULT_PYTHON "/usr/bin/python3"
set -x PROJECT_HOME "~/Projects"

set -x EDITOR "vim"
set -x EMAIL "mail@codyjohnson.xyz"
set -x MATLAB_SHELL "/usr/bin/bash"

set -x FZF_DEFAULT_OPTS "--height 40% --layout=reverse"
set -x FZF_CTRL_T_OPTS '--preview "bat --style=numbers --color=always {} 2> /dev/null | head -500"'

set -x FZF_FIND_FILE_OPS '--preview "bat --style=numbers --color=always {} 2> /dev/null | head -500"'
#set -x FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always"


# fisher
# autoinstall for new systems
#if not functions -q fisher
#    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#    fish -c fisher
#end

# install fzf if not present
#which fzf > /dev/null 2>&1
#if test $status -ne 0
#  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
#  $HOME/.fzf/install --all
#end


# custom home for fisher
set -g fisher_path $XDG_CONFIG_HOME/fisher_packages
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
      builtin source $file 2> /dev/null
end


# key bindings
bind \es fpass
bind \ef source_conf


# enable virtualfish
if [ (hostname) = "mobile" ]
  eval (python3 -m virtualfish auto_activation projects)
else if [ (hostname) = "arch-py" ]
  eval (python3 -m virtualfish auto_activation projects)
else if [ (hostname) = "dell-desk" ] 
  eval (python3 -m virtualfish auto_activation projects)
end

#cd ~
