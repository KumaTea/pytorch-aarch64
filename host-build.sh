#!/usr/bin/env bash

set -xe

bash check-arch.sh

bash pull.sh

bash build-env-ci.sh

bash push-ci.sh

bash cleanup.sh
