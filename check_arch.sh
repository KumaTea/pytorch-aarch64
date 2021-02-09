#!/usr/bin/env bash

if [ $(uname -m) = "aarch64" ]; then
  exit 0
else
  echo "NOT aarch64!"
  exit 1
fi
