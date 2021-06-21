#!/usr/bin/env bash

set -xe

bash build.sh 36
bash build.sh 37
bash build.sh 38
bash build.sh 39
bash build.sh 310

bash test.sh 36
bash test.sh 37
bash test.sh 38
bash test.sh 39
bash test.sh 310

bash push.sh 36
bash push.sh 37
bash push.sh 38
bash push.sh 39
bash push.sh 310
