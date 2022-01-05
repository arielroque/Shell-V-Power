#!/bin/bash

ARGUMENTS=$@
DATA=()
IFS=$'\n'
QUERY=$(cat /etc/passwd)

if [[ "$ARGUMENTS" == *"-order"* ]]; then
    QUERY=$(cat /etc/passwd | sort)
fi

for linha in $QUERY
      do  
       USER="$(echo "$linha" | awk -F: '{print $1}')"
       UUID="$(echo "$linha" | awk -F: '{print $3}')"
       DESCRIPTION="$(echo "$linha" | awk -F: '{print $5}')"
       SHELL="$(echo "$linha" | awk -F: '{print $7}')"
       GROUP=$(groups "$USER" | awk -F: '{print $2}')
       DIR=$(du -sh $SHELL)
       DATA+=("$USER;$UUID;$DESCRIPTION;$SHELL;$GROUP;$DIR")
done

echo "--------------------------------------"

for i in "${DATA[@]}"; do

  IFS=';'
  read -a strarr <<< "$i"

  if [[ "$ARGUMENTS" == *"-human"* && ${strarr[1]} -lt 1000 ]]; then
     continue
  fi

  if [[ "$ARGUMENTS" == *"-active"* && "${strarr[3]}" == *"nologin"* ]]; then
     continue
  fi

  if [[ "$ARGUMENTS" == *"-nonactive"* && "${strarr[3]}" != *"nologin"* ]]; then
     continue
  fi

  echo "Usuário: ${strarr[0]}"
  echo "UID: ${strarr[1]}"
  echo "Nome/Descrição: ${strarr[2]}"
 
  if [[ "$ARGUMENTS" == *"-group"* ]]; then
    echo "Grupo(s): ${strarr[4]}"
  fi

  if [[ "$ARGUMENTS" == *"-dir"* ]]; then
    echo "Diretório: ${strarr[5]}"
  fi

  echo "--------------------------------------"

done






