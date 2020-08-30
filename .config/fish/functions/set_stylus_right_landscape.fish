# Defined in /tmp/fish.50IXZf/set_stylus_right_landscape.fish @ line 2
function set_stylus_right_landscape
  # use xsetwacom to setup up Huion H950P
  # The stylus will be confined to right monitor

  # devices
  set STYLUS (string trim (xsetwacom --list | grep Pen | cut -f 1))
  set STRIP (string trim (xsetwacom --list | grep Strip | cut -f 1))
  set PAD (string trim (xsetwacom --list | grep Pad | cut -f 1))

  # set output to HEAD-2 (right monitor)
  xsetwacom set $STYLUS MapToOutput "HEAD-1"
end
