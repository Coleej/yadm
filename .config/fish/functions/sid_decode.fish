# Defined in /tmp/fish.qu8izU/sid_decode.fish @ line 2
function sid_decode
	for sid in (ls *.sid)
    /opt/GeoExpressCLUtils-9.5.0.4326-linux64/bin/mrsidgeodecode -i $sid -o $sid.tifg -of tifg
  end
end
