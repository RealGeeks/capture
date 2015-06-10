n=$1
color=$2 

for name in $(ls ${color}*)
do
  mv $name _$(printf "%02d" $n)-$name
  let n=n+1
done
