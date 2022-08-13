log_path=$1
n=$2

# TODO: Block IPs with more than n request per minute by iptables

awk -F \" '{print $1}' $log_path | sed 's/ - - /\t/g;s/ +0000//g;s/\[//g;s/\]//g;s/:/ /;s/\//-/g' | sort -k 2,3 | cut -d : -f-2 > sample

awk '{print $2,$3}' sample | uniq | while read line;do sed -n "/$line/p" sample |  sort -k1,1 | uniq -c | awk -v c=$n '$1 >= c {print $2}';done | sort | uniq
# nd=`date "+%d-%b-%Y %T" -d "$i 1 min"`
