# Defined in /tmp/fish.BF762c/fpass.fish @ line 2
function fpass --description 'Fuzzy-find a Lastpass entry and copy the password'
	if not lpass status -q
    lpass login $EMAIL
  end

  if not lpass status -q
    exit
  end

  lpass ls | fzf | string replace -r -a '.+\[id: (\d+)\]' '$1' | read -l result; and lpass show -c --password "$result"

  read -l -P 'Print account information [y/N]? ' confirm

  switch $confirm
    case Y y
      lpass show -- all "$result"
      commandline -f repaint
      return 0
    case '' N n
      commandline -f repaint
  end
end
