#!/bin/bash
export input=${1}
if [ "${input}" == "blue" ];
then
    WEBSITE_TITLE='blue'
    WEBSITE_IMAGE='parrot-1.jpg'
    WEBSITE_VERSION=1.0.0
else
    WEBSITE_TITLE='green'
    WEBSITE_IMAGE='parrot-2.jpg'
    WEBSITE_VERSION=2.0.0
fi
