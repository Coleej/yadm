# Defined in /tmp/fish.pfpbsD/fish_default_mode_prompt.fish @ line 2
function fish_default_mode_prompt --description 'Display the default mode for the prompt'
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold white
                echo '['
                set_color --bold red
                echo 'N'
                set_color --bold white
                echo ']'
            case insert
                set_color --bold white
                echo '['
                set_color --bold green
                echo 'I'
                set_color --bold white
                echo ']'
            case replace_one
                set_color --bold white
                echo '['
                set_color --bold green
                echo 'R'
                set_color --bold white
                echo ']'
            case replace
                set_color --bold white
                echo '['
                set_color --bold cyan
                echo 'R'
                set_color --bold white
                echo ']'
            case visual
                set_color --bold white
                echo '['
                set_color --bold magenta
                echo 'V'
                set_color --bold white
                echo ']'
        end
        set_color normal
        echo -n ' '
    end
end
