#!/bin/bash

j=10
for i in {1..10}
do
  usrname=`cut -d ' ' -f 3 usernames.txt | tail -n "$j" | head -n 1`
  pass=`cut -d ' ' -f 4 usernames.txt | tail -n "$j" | head -n 1`
  useradd "$username" -p "$pass"
  j=$((10-$i))
