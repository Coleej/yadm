# Defined in /tmp/fish.QUXRT7/pyimp.fish @ line 2
function pyimp
	set -l module $argv[1]
  if python -c "import $module"
    echo "python environment contains module: $module"
  end
end
