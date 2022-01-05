#!/bin/bash

function delete_images()
{
    docker rmi -f $(docker images -a -q)
}

function delete_containers(){
    docker rm -vf $(docker ps -a -q)
}

OPTION=0

echo "==================================="
echo "1) Delete All Containers"
echo "2) Delete All Images"
echo "3) Delete All Containers and Images"
echo "==================================="

read OPTION

case $OPTION in
    1) delete_containers
    ;;
    2) delete_images
    ;;

    3) delete_containers
       delete_images
    ;;   
     
    *) echo "Invalid Option"
    ;;
esac


