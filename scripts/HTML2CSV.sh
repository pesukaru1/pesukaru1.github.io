#!/bin/bash
### Created this shell script to convert the spark dispatcher logs accessible as HTML to CSV so that we can use the data for different purposes.
create_csv()
{
awk -v RS='' '{gsub("\n", ", "); print}' textfile > rawfile.csv
rm -f dump.txt textfile
}

html_clean()
{
curl -s "URL_TO_BE_HIT" > table.html
sed -e 's/<[^>]*>//g' table.html | awk '$1=$1' | sed '1,11d' | sed '$d' | sed '$d' > dump.txt
rm -f table.html
}

clean_text()
{
COUNTER=1
echo "COMMA_SEPERATED_HEADERS_OF_TABLES" > textfile
while read -r line
do
	if [ $COUNTER -le 6 ]
	then
	echo "$line" >> textfile
	let COUNTER+=1
	else
	echo "$line"$'\n' >> textfile
	let COUNTER=1
	fi
done < dump.txt
}

check_status()
{
prev_date=$(date --date="5 days ago" +'%Y/%m/%d')
time=$(date +"%T")
H=`date +"%T" | cut -f 1 -d ':'`
M=`date +"%T" | cut -c 4`
grep "$prev_date $H:$M[0-9]:[0-9][0-9]" rawfile.csv > csvfile.csv
}

### Main script starts here
html_clean
clean_text
create_csv
check_status