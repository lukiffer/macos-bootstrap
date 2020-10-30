#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs the AWS CLI"
}

function install() {
  local -r package_name="AWSCLIV2.pkg"
  curl "https://awscli.amazonaws.com/$package_name" -o "$package_name"
  sudo installer -pkg "$package_name" -target /
  rm -rf "$package_name"
}
