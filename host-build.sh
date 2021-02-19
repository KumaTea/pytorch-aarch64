#!/usr/bin/env bash

set -xe

bash check-arch.sh

bash pull.sh

bash build-env.sh

bash push.sh

bash cleanup.sh
