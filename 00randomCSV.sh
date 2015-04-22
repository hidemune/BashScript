#!/bin/bash

# csvからランダムに指定数の行を取得(1 - 259883)

echo $rand

# 配列に入れる
ARRAY1=()
CSVFILE="data.txt"
#ファイルを配列に読み込む
IFS=$'\n'
ARRAY1=(`cat "$CSVFILE"`)

# RAND & echo
max=120
for ((i=0; i < $max; i++)); do
  rand=$(( $(od -vAn -N4 -tu4 < /dev/random) % ${#ARRAY1[*]} ))
  echo ${ARRAY1[$rand]} >> rand.csv
  echo rand$i
done
