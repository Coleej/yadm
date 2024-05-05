function clean_xb
	set total $argv[1]

	set files **/*.bcf; rm -f $files &>/dev/null
	set files **/XBerror.txt; rm -f $files &>/dev/null
	set files **/XBlog.txt; rm -f $files &>/dev/null
	set files **/XBwarning.txt; rm -f $files &>/dev/null
	
	if $total = true
		set files **/xboutput.nc; rm -rf $files &>/dev/null
	end

end
