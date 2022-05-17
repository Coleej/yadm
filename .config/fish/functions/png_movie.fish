function png_movie
  
  set fr $argv[1]
  set pngs $argv[2]
  set fn $argv[3]

  ffmpeg -r $fr -f image2 -s 1920x1080 -i $pngs -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -vcodec libx264 -crf 25  -pix_fmt yuv420p $fn

end
