#!/bin/bash
for each in /proc/*; do
  if [[ $(echo $each | grep -Po "\\d+") ]]; then
    if [[ $(cat "$each/cmdline" | grep -a cpuminer.sh) ]]; then
      echo healthy
    fi
  fi
done
