#!bin/bash

processes_id= $(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processes_id; do
   echo $(ps -p $pid -o comm=)
done