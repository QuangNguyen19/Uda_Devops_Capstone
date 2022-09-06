#!/bin/bash
if [ "${1}" == "blue" ];
then
    cd website
    docker image build --tag dangquanghui/parrot:${1} .
else
    cd website
    docker image build \
    --build-arg TITLE='Green Parrot' \
    --build-arg IMAGE='parrot-2.jpg' \
    --build-arg VERSION='1.1.0' \
    --tag dangquanghui/parrot:${1} \
    .
fi
