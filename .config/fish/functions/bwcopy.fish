function bwcopy
  set pw fmb777999

  if not set -q BW_SESSION
    bw login mail@codyjohnson.xyz $pw >/dev/null 2>&1 
    bw unlock $pw > /tmp/bw.txt
    sed -nE 's|.*="(.*)"|\1|pi' /tmp/bw.txt | head -1 | read BW_SESSION
    set -x BW_SESSION $BW_SESSION
  end

  if command -sq bw and command -sq fzf and command -sq xclip
        bw get item (
            bw list items \
            | jq -r '.[] | [.name, .login.username // "", .id] | @tsv' \
            | column -t -s \t \
            | fzf --with-nth 1..-2 --preview-window down:2 \
                       --preview 'bw get item (echo {} | awk \'{print $NF}\') | jq -r \'.login.uris | .[] | .uri // empty \'' \
            | awk '{print $NF}'
        ) | jq -r '.login.password' | xsel -i -b
    end
end

