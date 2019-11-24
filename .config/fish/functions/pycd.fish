# Defined in /tmp/fish.lkO09w/pycd.fish @ line 2
function pycd
	set -l module $argv[1]
  if python -c "import $module"
    pushd (python -c "import os.path, $module; print(os.path.dirname($module.__file__))")
  else
    exit
  end
end
