function mpga2mp3
  set in $argv[1]
  set out $argv[2]
  echo "$in --> $out"
  ffmpeg -i $in -vn -acodec copy $out
end
