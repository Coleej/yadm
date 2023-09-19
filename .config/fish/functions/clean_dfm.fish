function clean_dfm
	set total $argv[1]

	rm dflowfm/DFM_interpreted_idomain_*
	rm dflowfm/*_0*_net.nc
	rm dflowfm/*_0*.mdu
	rm dflowfm/unstruc.dia
	rm wave/BOTNOW
	rm wave/INPUT
	rm wave/NEST*
	rm wave/PET0.RegridWeightGen.Log
	rm wave/SWANIN_*
	rm wave/SWANOUT*
	rm wave/TMP_*
	rm wave/*.prt
	rm wave/*.swn
	rm wave/esmf_bat.log
	rm wave/norm_end
	rm wave/swan.inp
	
	if $total = true
		rm -rf dflowfm/output
		rm wave/*.sp1
		rm wave/*.sp2
		rm wave/wavh-*
		rm wave/wavm-*
		rm wave/*.tab
		rm wave/swn-diag.*
		rm wave/swan_bat.log
	end

end
