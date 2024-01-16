#!/bin/bash

DEFAULT_REPO='AlgebraicX.jl'
DEFAULT_UUID='b66562e1-fa90-4e8b-9505-c909188fab76' 

usage="This script is for initializing the template with the new repository name and UUID. Please provide the new repository name and UUID in that order.

Example: ./init.sh '$DEFAULT_REPO' '$DEFAULT_UUID'"

REPO=$1
UUID=${2:-$(uuidgen)}

# set to lowercase
UUID=${UUID,,}

if [ ! $REPO ] || [ ! $UUID ]; then
  echo ""
  echo $usage$ >&2; exit 1
fi

read -p "By continuing, the following substitutions will be made:

REPO: $DEFAULT_REPO => $REPO
UUID: $DEFAULT_UUID => $UUID

Are you sure?" -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]
then 
  [[ "$0" = "BASH_SOURCE" ]] && exit 1 || return 1
fi

# rename 
mv src/$DEFAULT_REPO.jl src/$REPO.jl

# get version
unameOut="$(uname -s)"

case "${unameOut}" in
  Linux*)  
    git grep -l $DEFAULT_REPO | xargs sed -i 's/{$REPO}/{$REPO}/g';
    git grep -l $DEFAULT_UUID | xargs sed -i 's/{$UUID}/{$UUID}/g';;
  Darwin*) 
    git grep -l $DEFAULT_REPO | xargs sed -i '' -e 's/{$REPO}/{$REPO}/g';
    git grep -l $DEFAULT_UUID | xargs sed -i '' -e 's/{$UUID}/{$UUID}/g';;
  *)       
    echo UNKNOWN:${unameOut};; 
esac

git commit -am "Initialized $REPO"
git push