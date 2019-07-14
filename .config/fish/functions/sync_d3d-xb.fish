# Defined in /tmp/fish.zCQYyk/sync_d3d-xb.fish @ line 2
function sync_d3d-xb
	set base_dir $argv[2]
	
  switch (hostname)
  case "mobile"
    
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@qb.loni.org:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/output /media/cjohnson/sg_external/model_results/coupled_delft3d_xbeach/$base_dir/
    
    case "smic"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@smic.hpc.lsu.edu:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/output /media/cjohnson/sg_external/model_results/coupled_delft3d_xbeach/$base_dir/
    end
  
  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cjohnson/.rsync_delft3d_includes cjoh296@qb.loni.org:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/output /home/cjohnson/Modeling/coupled_delft3d_xbeach/$base_dir/
    
    case "smic"
      rsync -avrz --no-l --include-from=/home/cjohnson/.rsync_delft3d_includes cjoh296@smic.hpc.lsu.edu:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/output /home/cjohnson/Modeling/coupled_delft3d_xbeach/$base_dir/
    end
  
  end
end
