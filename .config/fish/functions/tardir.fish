function tardir
    tar czvf $argv.tar.gz $argv
    cp -r $argv /tmp/$argv
    rm -rf $argv
end
