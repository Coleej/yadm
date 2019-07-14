# Defined in /tmp/fish.5CywdL/sync_d3d.fish @ line 2
function sync_d3d
	switch (hostname)
  case "mobile"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@qb.loni.org:/work/cjoh296/delft3d.wd/models/ /media/cjohnson/sg_external/model_results/delft3d/models
    case "smic"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@smic.hpc.lsu.edu:/work/cjoh296/delft3d.wd/models/ /media/cjohnson/sg_external/model_results/delft3d/models
    case "local"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes --include="*/" --exclude="*" /home/cjohnson/Phd/40_modeling/delft3d/models/ /media/cjohnson/sg_external/model_results/delft3d/models
    end
  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes cjoh296@qb.loni.org:/work/cjoh296/delft3d.wd/models/ /home/cjohnson/Modeling/delft3d/models
    case "smic"
      rsync -avrz --no-l --include-from=/home/cjohnson/.rsync_delft3d_includes cjoh296@smic.hpc.lsu.edu:/work/cjoh296/delft3d.wd/models/ /home/cjohnson/Modeling/delft3d/models
    end
  end
end
