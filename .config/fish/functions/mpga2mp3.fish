function mpga2mp3
  set in $argv[1]
  set out $argv[2]
  
  ffmpeg -i $in -vn -acodec copy $out

  if test $status -eq 0
    rm $in
  end
  
  echo "$in --> $out"

end
