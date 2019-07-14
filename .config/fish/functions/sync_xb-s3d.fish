# Defined in /tmp/fish.zQDSqX/sync_xb-s3d.fish @ line 2
function sync_xb-s3d
	switch (hostname)
  case "mobile"
    switch $argv[1]
    case "qb"
      rsync -avrz --include='*/' --include='*.nc' --exclude='*' cjoh296@qb.loni.org:/work/cjoh296/xbeach-settle3d.wd/models/ /media/cjohnson/sg_external/model_results/xbeach-settle3d/models
    case "smic"
      rsync -avrz --include='*/' --include='*.nc' --exclude='*' cjoh296@smic.hpc.lsu.edu:/work/cjoh296/xbeach-settle3d.wd/models/ /media/cjohnson/sg_external/model_results/xbeach-settle3d/models
    end

  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --include='*.nc' --filter='P *.nc' --filter='P attributes/' --filter='P .git/' cjoh296@qb.loni.org:/work/cjoh296/xbeach-settle3d.wd/models/ /home/cjohnson/Modeling/xbeach-settle3d/models
    case "smic"
      rsync -avrz --include='*.nc' --filter='P *.nc' --filter='P attributes/' --filter='P .git/' cjoh296@smic.hpc.lsu.edu:/work/cjoh296/xbeach-settle3d.wd/models/ /home/cjohnson/Modeling/xbeach-settle3d/models
    end
  
  end
end
