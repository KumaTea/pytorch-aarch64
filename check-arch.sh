#!/usr/bin/env bash

if [ $(uname -m) = "aarch64" ]; then
  echo "aarch64 found!"
  lscpu | grep "CPU(s):"
  exit 0
else
  echo "NOT aarch64!"
  exit 1
fi
