# Defined in /tmp/fish.5CywdL/sync_d3d.fish @ line 2
function d3d_inputs
	switch (hostname)
  case "mobile"
    switch $argv[1]
    case "qb"
      rsync -avrz --exclude-from="/home/cjohnson/.rsync_delft3d_inputs" /home/cjohnson/Phd/40_modeling/delft3d/ cjoh296@qb.loni.org:/work/cjoh296/delft3d.wd
    case "smic"
      rsync -avrz --exclude-from="/home/cjohnson/.rsync_delft3d_inputs" /home/cjohnson/Phd/40_modeling/delft3d/ cjoh296@smic.hpc.lsu.edu:/work/cjoh296/delft3d.wd
    end
  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --exclude-from="/home/cjohnson/.rsync_delft3d_inputs" /home/cjohnson/Modeling/delft3d/ cjoh296@qb.loni.org:/work/cjoh296/delft3d.wd
    case "smic"
      rsync -avrz --exclude-from="/home/cjohnson/.rsync_delft3d_inputs" /home/cjohnson/Modeling/delft3d/ cjoh296@smic.hpc.lsu.edu:/work/cjoh296/delft3d.wd
    end
  end
end
