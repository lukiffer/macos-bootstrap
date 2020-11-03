#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs the latest version of the Postman application"
}

function install() {
  echo "Downloading Postman..."
  curl -fsSL https://dl.pstmn.io/download/latest/osx > postman.zip

  echo "Unzipping Postman application..."
  unzip postman.zip

  echo "Moving Postman application into place..."
  mv Postman.app /Applications/

  echo "Cleaning up Postman archive file..."
  rm -rf postman.zip
}
