# Defined in /tmp/fish.YBwWCD/sync_d3d-xb.fish @ line 2
function sync_d3d-xb
	set base_dir $argv[2]
  set output $argv[3]
	
  switch (hostname)
  case "mobile"
    
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@qb.loni.org:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/$output /media/cody/sg_external/model_results/coupled_delft3d_xbeach/$base_dir/$output
    
    case "smic"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_delft3d_includes --include="*/" --exclude="*" cjoh296@smic.hpc.lsu.edu:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/$output /media/cody/sg_external/model_results/coupled_delft3d_xbeach/$base_dir/$output
    end
  
  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_delft3d_includes cjoh296@qb.loni.org:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/$output /home/cody/Modeling/coupled_delft3d_xbeach/$base_dir/$output

    case "smic"
      rsync -avrz --no-l --include-from=/home/cody/.config/rsync/file_lists/rsync_delft3d_includes cjoh296@smic.hpc.lsu.edu:/work/cjoh296/coupled_delft3d_xbeach.wd/$base_dir/$output /home/cody/Modeling/coupled_delft3d_xbeach/$base_dir/$output
    
    end
  
  end
end
