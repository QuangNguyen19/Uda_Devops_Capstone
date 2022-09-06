#!/bin/bash
export input=${1}
if [ "${input}" == "blue" ];
then
    TITLE='blue'
    IMAGE='parrot-1.jpg'
    VERSION=1.0.0
else
    TITLE='green'
    IMAGE='parrot-2.jpg'
    VERSION=2.0.0
fi
