function clean_dfm
	set total $argv[1]

	set files **/unstruc.dia; rm -f $files &>/dev/null
	
	set files **/DFM_interpreted_idomain_*; rm -f $files &>/dev/null
	set files **/*_0*_net.nc; rm -f $files &>/dev/null
	set files **/*_0*.mdu; rm -f $files &>/dev/null
	set files **/*_0*.cache; rm -f $files &>/dev/null
	
	set files **/BOTNOW; rm -f $files &>/dev/null
	set files **/WNDNOW; rm -f $files &>/dev/null
	set files **/CURNOW; rm -f $files &>/dev/null
	set files **/swaninit; rm -f $files &>/dev/null
	set files **/INPUT; rm -f $files &>/dev/null
	set files **/PET0.RegridWeightGen.Log; rm -f $files &>/dev/null
	set files **/esmf_bat.log; rm -f $files &>/dev/null
	set files **/norm_end; rm -f $files &>/dev/null
	set files **/swan.inp; rm -f $files &>/dev/null
	set files **/PRINT; rm -f $files &>/dev/null
	
	set files **/NEST*; rm -f $files &>/dev/null
	set files **/hot_*; rm -f $files &>/dev/null
	set files **/SWANIN_*; rm -f $files &>/dev/null
	set files **/SWANOUT*; rm -f $files &>/dev/null
	set files **/TMP_*; rm -f $files &>/dev/null
	set files **/*.prt; rm -f $files &>/dev/null
	set files **/*.swn; rm -f $files &>/dev/null
	
	if $total = true
		set files **/output; rm -rf $files &>/dev/null
		
		set files **/swan_bat.log; rm -f $files &>/dev/null
		
		set files **/*n*.sp1; rm -f $files &>/dev/null
		set files **/*n*.sp2; rm -f $files &>/dev/null
		set files **/wavh-*; rm -f $files &>/dev/null
		set files **/wavm-*; rm -f $files &>/dev/null
		set files **/*.tab; rm -f $files &>/dev/null
		set files **/swn-diag.*; rm -f $files &>/dev/null

		set files **/*.h5; rm -f $files &>/dev/null
		set files **/*.csv; rm -f $files &>/dev/null
		set files **/*.sp2; rm -f $files &>/dev/null
		set files **/*.sp1; rm -f $files &>/dev/null
	end

end
