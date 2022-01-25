#!/bin/bash
arr=('webtoon.xyz' 'mangalivre.net' 'mangalivre.com' 'twitch.tv' 'instagram.com' 'facebook.com' 'twitter.com' 'twttr.com' 'twitter.fr' 'twitter.jp' 'twitter.rs' 'twitter.uz' 'twitter.biz' 'twitter.dk' 'twitter.events' 'twitter.ie' 'twitter.je' 'twitter.mobi' 'twitter.nu' 'twitter.pro' 'twitter.su' 'twitter.vn' 'twitter.com' 'twitter.gd' 'twitter.im' 'twitter.hk' 'twitter.jp' 'twitter.ch' 'twitter.pt' 'twitter.rs' 'twitter.com.br' 'twitter.ae' 'twitter.eus' 'ns1.p34.dynect.net' 'ns2.p34.dynect.net' 'ns3.p34.dynect.net' 'ns4.p34.dynect.net' 'd01-01.ns.twtrdns.net' 'd01-02.ns.twtrdns.net' 'a.r06.twtrdns.net' 'b.r06.twtrdns.net' 'c.r06.twtrdns.net' 'api-34-0-0.twitter.com' 'api-47-0-0.twitter.com' 'cheddar.twitter.com' 'goldenglobes.twitter.com' 'mx003.twitter.com' 'pop-api.twitter.com' 'spring-chicken-an.twitter.com' 'spruce-goose-ae.twitter.com' 'takeflight.twitter.com' 'www2.twitter.com')
if [ $1 == "on" ]
then
    for i in "${arr[@]}"
    do
        echo 0.0.0.0 www.$i >> /etc/hosts
        echo 0.0.0.0 $i >> /etc/hosts
        echo 0.0.0.0 m.$i >> /etc/hosts
        echo 0.0.0.0 mobile.$i >> /etc/hosts    
        echo fe80::1%lo0 www.$i >> /etc/hosts
        echo fe80::1%lo0 $i >> /etc/hosts
        echo fe80::1%lo0 m.$i >> /etc/hosts
        echo fe80::1%lo0 mobile.$i >> /etc/hosts  

    done
else
    if [ $1 == "off" ]
    then
        sed -i '/0.0.0.0/d' /etc/hosts
        sed -i '/fe80::1%lo0/d' /etc/hosts
        echo 'VAI ESTUDAR SEU MIZERA'
    fi
fi