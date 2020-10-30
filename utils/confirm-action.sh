#!/usr/bin/env bash

function confirm() {
  local -r environment_override="MACOSBS__$1"
  local -r prompt="$2"
  local result="false"

  if [ -z "${!environment_override}" ]; then
    # No preference was specified in the environment
    echo >&2 "$prompt (y/N)"
    read -r confirm
    if [ "$confirm" == "y" ]; then
      result="true"
    else
      result="false"
    fi
  else
    result="$environment_override"
  fi

  echo "$result"
}
