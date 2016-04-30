#!/bin/sh

BUILD_NAME=build-$(date +"%Y-%m-%d-%y-%H:%M.%N")

mkdir $BUILD_NAME
mv * $BUILD_NAME
tar -czf build.tgz $BUILD_NAME

scp -p 11160 -i id_dsa -o 'StrictHostKeyChecking no' build.tgz app@alpha-node-2.rosti.cz:/srv/
ssh app@alpha-node-2.rosti.cz -p -i id_dsa 11160 -o 'StrictHostKeyChecking no' "tar xfz  /srv/build.tgz && /srv/${BUILD_NAME}/install.sh ${BUILD_NAME}"
