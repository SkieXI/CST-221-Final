echo "Program start:"

inputFile=$1
group_name=$2
op_flag=$3

cat $inputFile | while read ln
do

	var1=$(echo $ln | cut -f1 -d' ')
	var2=$(echo $ls | cut -f2 -d' ')
	echo $var1
	echo $var2

	var2=$(echo $var2 | openssl enc -based64)

	if grep -q $group_name /etc/group
	then
		if [[ $op_flag == "-a" ]]
		then
			#echo Got an \'add user\' command
			#echo " using the $inputFile"
			adduser $var1 -p $var2 -G $group_name
		fi
		if [[ $op_flag == "-r" ]]
		then
			deluser --remove-home $var1
		fi
		if [[ $op_flag == "" ]]
		then
			echo "Error: blank commaand:"
			echo "use -a to add user."
			echo "use -r to remove user."
		fi
	else
		groupadd $group_name
		if [[ $op_flag == "-a" ]]
		then 
			adduser $var1 -p $var2 -G $group_name
		fi
		if [[ $op_flag == "-r" ]]
		then
			deluser --remove-home $var1
		fi
		if [[ $op_flag == "" ]]
		then
			echo "Error: blank commaand:"
			echo "use -a to add user."
			echo "use -r to remove user."
		fi
	fi
done
echo "Program finished."
