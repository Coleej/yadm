function clean_dfm
	set total $argv[1]

	rm dflowfm/unstruc.dia &>/dev/null
	
	set files dflowfm/DFM_interpreted_idomain_*; rm -f $files &>/dev/null
	set files dflowfm/*_0*_net.nc; rm -f $files &>/dev/null
	set files dflowfm/*_0*.mdu; rm -f $files &>/dev/null
	
	rm wave/BOTNOW &>/dev/null
	rm wave/INPUT &>/dev/null
	rm wave/PET0.RegridWeightGen.Log &>/dev/null
	rm wave/esmf_bat.log &>/dev/null
	rm wave/norm_end &>/dev/null
	rm wave/swan.inp &>/dev/null
	rm wave/PRINT &>/dev/null
	
	set files wave/NEST*; rm -f $files &>/dev/null
	set files wave/SWANIN_*; rm -f $files &>/dev/null
	set files wave/SWANOUT*; rm -f $files &>/dev/null
	set files wave/TMP_*; rm -f $files &>/dev/null
	set files wave/*.prt; rm -f $files &>/dev/null
	set files wave/*.swn; rm -f $files &>/dev/null
	
	if $total = true
		rm -rf dflowfm/output &>/dev/null
		
		rm wave/swan_bat.log &>/dev/null
		
		set files wave/*.sp1; rm -f $files &>/dev/null
		set files wave/*.sp2; rm -f $files &>/dev/null
		set files wave/wavh-*; rm -f $files &>/dev/null
		set files wave/wavm-*; rm -f $files &>/dev/null
		set files wave/*.tab; rm -f $files &>/dev/null
		set files wave/swn-diag.*; rm -f $files &>/dev/null
	end

end
