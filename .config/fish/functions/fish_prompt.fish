# git functions
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

# change color depending on the user.
function _user_host
  if [ (id -u) = "0" ];
    echo -n (set_color -o red)
  else
    echo -n (set_color -o blue)
  end
  echo -n (hostname|cut -d . -f 1)ˇ$USER (set color normal)
end

# fish prompt
function fish_prompt
	set fish_greeting
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l magenta (set_color -o magenta)
  set -l orange (set_color -o ffa500)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l darkblue (set_color 000087)
  set -l springgreen (set_color -o 00875f)
  set -l darkred (set_color -o 870000)
  set -l skyblue (set_color -o 87d7ff)
  set -l royalblue (set_color -o 5f5fff)
  set -l deeppink (set_color -o af005f)
  set -l paleturquoise (set_color 5f8787)

  # add newline before new prompts
  #  echo -e ''

  # change color by hostname
  switch (hostname)
    case mobile
      set -g host_color $paleturquoise
    case dell-desk
      set -g host_color $blue
    case media
      set -g host_color $orange
    case pi
      set -g host_color $magenta
    case arch-box
      set -g host_color $cyan
    case '*'
      set -g host_color $royalblue
  end

  set -l cwd $deeppink(prompt_pwd)

  # output the prompt, left to right:
  if set -q VIRTUAL_ENV
    echo -n -s (set_color white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  
  # display 'user@host:'
  echo -n -s $skyblue (whoami) @ $host_color (hostname|cut -d . -f 1) ": "

  # display the current directory name:
  echo -n -s $cwd $normal

  # show git branch and dirty state, if applicable:
  if [ (_git_branch_name) ]
    set -l git_branch '[' (_git_branch_name) ']'

    if [ (_is_git_dirty) ]
      set git_info $darkred $git_branch "✗"
    else
      set git_info $springgreen $git_branch "✓"
    end
    echo -n -s ' ' $git_info $normal
  end

  # terminate with a nice prompt char:
  echo -n -s -e '\n∮ ' $normal
end
