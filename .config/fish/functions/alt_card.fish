# Defined in /tmp/fish.0IMMmo/alt_card.fish @ line 2
function alt_card
  set cardfile $argv[1]
  set card $argv[2]
  set card_val $argv[3]
  set new_card (printf "%-36s%-36s\n" $card $card_val)

  grep -i -q $card $cardfile

  if test $status -eq 0
    echo ""
    sed -i".bak" "s|$card.*|$new_card|g" $cardfile
  else
    sed -i".bak" "s|END_PARAMETERS.*|$new_card|g" $cardfile
    echo -e "\nEND_PARAMETERS" >> $cardfile
  end
end
