#!/bin/bash
#(C) 2019 Ariel Roque / UFCG

source=$(ls shared/conversao)

echo $source

echo -e "\e[33mConverting image, please wait...\e[0m"

for image in $source; do
    new_image=${image/.jpg/.png}
    echo $image
    convert shared/conversao/$image shared/conversao/$new_image
done

echo -e "\e[32mFinished conversion \e[0m"