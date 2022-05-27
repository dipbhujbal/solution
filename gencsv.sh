RANDOM=$$
for i in $(seq 0 9)
do 
   R=$RANDOM 
   echo $i,$R>>inputFile.csv
done