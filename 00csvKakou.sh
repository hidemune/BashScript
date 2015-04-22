#!/bin/bash


# "都道府県コード","都道府県名","市区町村コード","市区町村名","大字町丁目コード","大字町丁目名","緯度","経度","原典資料コード","大字・字・丁目区分コード"
# ↓
# "都道府県名""市区町村名""大字町丁目名","緯度","経度",

# CSV加工スクリプト

CSVFILE="idokeido.txt"

for line in `cat ${CSVFILE} | sed -e '/^[,|]*$/d' -e '/^,/d'`
do
    line2=${line//\"/}
    todo=`echo $line2 | cut -d, -f2`
    city=`echo $line2 | cut -d, -f4`
    address=`echo $line2 | cut -d, -f6`
    ido=`echo $line2 | cut -d, -f7`
    keido=`echo $line2 | cut -d, -f8`
    if [ $todo != '都道府県コード' ]; then
      echo "$todo$city$address,$ido,$keido,"
    fi
done
exit 0