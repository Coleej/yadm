# Defined in /tmp/fish.Z7Cj6Q/sync_xb.fish @ line 2
function sync_xb
	set mod $argv[2]
	switch (hostname)
  case "mobile"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_xbeach_includes --include="*/" --exclude="*" cjoh296@qb.loni.org:/work/cjoh296/xbeach.wd/models/$mod/ /media/cody/sg_storage/model_results/xbeach/models/$mod
    case "smic"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_xbeach_includes --include="*/" --exclude="*" cjoh296@smic.hpc.lsu.edu:/work/cjoh296/xbeach.wd/models/$mod/ /media/cody/sg_storage/model_results/xbeach/models/$mod
    case "local"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_xbeach_includes --include="*/" --exclude="*" /home/cody/Phd/40_modeling/xbeach/models/ /media/cody/sg_storage/model_results/xbeach/models
    end
  case "dell-desk"
    switch $argv[1]
    case "qb"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_xbeach_includes cjoh296@qb.loni.org:/work/cjoh296/xbeach.wd/models/ /home/cody/Modeling/xbeach/models
    case "smic"
      rsync -avrz --include-from=/home/cody/.config/rsync/file_lists/rsync_xbeach_includes cjoh296@smic.hpc.lsu.edu:/work/cjoh296/xbeach.wd/models/ /home/cody/Modeling/xbeach/models
    end
  end
end
