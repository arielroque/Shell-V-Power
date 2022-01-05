#!/bin/bash
LOOP=""
ID=""
ACTOR=""
WISH=""
OBJECTIVE=""

while [ "$LOOP" != "N" -a "$LOOP" != "n" ];do
    echo -e "\e[32mID US/TASK\e[0m"
    read ID
    echo -e "\e[32mActor (Default = desenvolvedor)\e[0m"
    read ACTOR
    echo -e "\e[32mWish\e[0m"
    read WISH
    echo -e "\e[32mObjective\e[0m"
    read OBJECTIVE
    echo ""
    echo -e "\e[36mDo you want to continue? \e[0m Y/N"
    read LOOP

    if [ -z $ACTOR ];then
        ACTOR="desenvolvedor"
    fi

    touch ~/activities.txt
    ACTIVITY=$ID":Eu como "$ACTOR" desejo "$WISH" para "$OBJECTIVE
    echo $ACTIVITY >>~/activities.txt
done


