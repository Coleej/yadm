# Configuration for virtualfish
set -x VIRTUALFISH_DEFAULT_PYTHON "/usr/bin/python3"
set -x PROJECT_HOME "~/Projects"
set -x EDITOR "vim"
set -x EMAIL "mail@codyjohnson.xyz"
set -x XDG_CONFIG_HOME $HOME/.config
set -x MATLAB_SHELL "/usr/bin/bash"

# key bindings
bind '\es' fpass

if [ (hostname) = "mobile" ] 
  eval (python3 -m virtualfish auto_activation projects)
  active
else if [ (hostname) = "arch-py" ]
  eval (python3 -m virtualfish auto_activation projects)
else if [ (hostname) = "dell-desk" ] 
  eval (python3 -m virtualfish auto_activation projects)
end

cd ~
