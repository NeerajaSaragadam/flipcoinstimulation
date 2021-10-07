target_count=21
minimum_difference=2
heads_count=0
tails_count=0
flips_count=0
while(( 1 ))
do
    (( flips_count++ ))
    echo -n "Flip-$flips_count is "
    toss=$(( RANDOM % 2 ))
    if(( toss == 0 ))
    then
        echo "Heads"
        (( heads_count++ ))
    else
        echo "Tails"
        (( tails_count++ ))
    fi
    
    diff_bt_hc_tc=$(( heads_count - tails_count ))
    if(( heads_count == target_count && diff_bt_hc_tc >= minimum_difference ))
    then
        echo "Heads won by $diff_bt_hc_tc points"
        break
    elif(( tails_count == target_count && ${diff_bt_hc_tc#-} >= minimum_difference ))
    then
         echo "Tails won by ${diff_bt_hc_tc#-} points"
         break
    fi
    
done
echo "The Heads count is $heads_count and Tails Count is $tails_count"
