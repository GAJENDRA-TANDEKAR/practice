#!/bin/bash -x
#
echo
echo "to Display  random Heads or Tails"
Result=$((RANDOM%2))
echo
if [[ ${Result} -eq 0 ]]; then
    echo HEADS win
elif [[ ${Result} -eq 1 ]]; then
    echo TAILS  win
fi
echo
read -p "Enter number of times to flip a Coins (combination):" num_of_coins

echo 
echo "          SINGLET **** COMBINATION"
echo
declare -A Singlet_combinations=( 

                                [H]=0
                                [T]=0

                              )
for(( flip = 1; flip <= num_of_coins; flip++ ))
do
    echo -n "Fliped coin $flip is "
    (( coin = RANDOM % 2 ))
    case $coin in 
        0)
            echo "Heads"
            (( Singlet_combinations[H]++ ))
            ;;
        1)
            echo "Tails"
            (( Singlet_combinations[T]++ ))
    esac
done
echo
for combination in ${!Singlet_combinations[@]}
do
    percentage=$(( ${Singlet_combinations[$combination]}  * 100 / num_of_coins ))
    Singlet_combinations[$combination]=$percentage
    echo "percentage of $combination is ${Singlet_combinations[$combination]}%"   
done
echo 
echo "          DOUBLET   ****   COMBINATION  "
echo
declare -A  Doublet_Combination=( 
    [HH]=0
    [HT]=0
    [TH]=0
    [TT]=0                          
    )
for(( flip = 1; flip <= num_of_coins; flip++ ))
do
    echo -n "Fliped coin $flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))
    case $coin_1$coin_2 in 
        00)
            echo "Heads Heads"
            (( Doublet_Combination[HH]++ )) 
            ;;
        01)
            echo "Heads Tails"
            ((  Doublet_Combination[HT]++ ))
            ;;
        10)
            echo "Tails Heads"
            ((  Doublet_Combination[TH]++ ))
            ;;
        11)
            echo "Tails Tails"
            ((  Doublet_Combination[TT]++ ))
            ;;
    esac
done
echo
for combination in ${!Doublet_Combination[@]}
do
    percentage=$(( ${Doublet_Combination[$combination]}  * 100 / num_of_coins))
     Doublet_Combination[$combination]=$percentage
    echo "percentage of $combination is ${Doublet_Combination[$combination]}%"   
done
echo
echo "          TRIPLET **** COMBINATION"
echo
declare -A Triplet_Combination=( 
[HHH]=0
[HHT]=0
[HTH]=0
[HTT]=0
[THH]=0
[THT]=0
[TTH]=0
[TTT]=0                         )
for(( flip = 1; flip <= num_of_coins; flip++ ))
do
    echo -n "Fliped coin $flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))
    (( coin_3 = RANDOM % 2 ))

    case $coin_1$coin_2$coin_3 in 
        000)
            echo "Heads Heads Heads"
            (( Triplet_Combination[HHH]++ )) 
            ;;
        001)
            echo "Heads Heads Tails"
            (( Triplet_Combination[HHT]++ ))
            ;;
        010)
            echo "Heads Tails Heads"
            (( Triplet_Combination[HTH]++ ))
            ;;
        011)
            echo "Heads Tails Tails"
            (( Triplet_Combination[HTT]++ ))
            ;;
        100)
            echo "Tails Heads Heads"
            (( Triplet_Combination[THH]++ )) 
            ;;
        101)
            echo "Tails Heads Tails"
            (( Triplet_Combination[THT]++ ))
            ;;
        110)
            echo "Tails Tails Heads"
            (( Triplet_Combination[TTH]++ ))
            ;;
        111)
           echo "Tails Tails Tails"
            (( Triplet_Combination[TTT]++ ))
            ;;
    esac
done
echo
for combination in ${!Triplet_Combination[@]}
do
    percentage=$(( ${Triplet_Combination[$combination]}  * 100 / num_of_coins ))
    Triplet_Combination[$combination]=$percentage
    echo "percentage of $combination is ${Triplet_Combination[$combination]}%"   
done

singlet_combinations=( ${!Singlet_combinations[@]} )
singlet_combination_percentages=( ${Singlet_combinations[@]} )

doublet_combinations=( ${!Doublet_Combination[@]} )
doublet_combination_percentages=( ${Doublet_Combination[@]} )

triplet_combinations=( ${!Triplet_Combination[@]} )
triplet_combination_percentages=( ${Triplet_Combination[@]} )

total_combinations+=( ${singlet_combinations[@]} ${doublet_combinations[@]} ${triplet_combinations[@]} )
total_combination_percentages+=( ${singlet_combination_percentages[@]} ${doublet_combination_percentages[@]} ${triplet_combination_percentages[@]} )

echo
echo " *** sorted the Singlet, Doublet and Triplet combination ***"
echo
echo  "sorted singlet percentages combination :"
echo "$( printf "%s\n" "${singlet_combination_percentages[@]}" | sort -n ) "

echo  "sorted doublet percentages combination :"
echo "$( printf "%s\n" "${doublet_combination_percentages[@]}" | sort -n ) "

echo  "sorted triplet percentages combination :"
echo "$( printf "%s\n" "${triplet_combination_percentages[@]}" | sort -n ) "
winning_combination ()
{
     local -n keys=$1
    local -n values=$2
    max_value=0
    max_value_index=0
    for(( i = 0; i < ${#values[@]}; i++ ))
    do
        if(( values[i] >= max_value ))
        then    
                max_value=${values[i]}
                max_value_index=$i
        fi
    done
    echo "The winning combination is ${keys[$max_value_index]} with ${max_value}%" 
}
echo "          WINNERS **** WINNERS **** WINNERS"
echo "For Singlet Combination"
winning_combination singlet_combinations singlet_combination_percentages
echo 
echo "For Doublet Combination"
winning_combination doublet_combinations doublet_combination_percentages
echo
echo "For Triplet Combination"
winning_combination triplet_combinations triplet_combination_percentages
echo

echo "For All Combinations"
winning_combination total_combinations total_combination_percentages