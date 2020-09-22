#!/bin/bash

nodes () { bspc query -N -n .above.sticky ; }

toggleHidden () {
  if [ $# -eq 0 ];
  then
    for node in $(nodes); do
      bspc node ${node} --flag hidden
    done
  else
    for node in $(nodes); do
      bspc node ${node} --flag hidden=${1}
    done
  fi
}

case $1 in
  addAndView)
    bspc node $2 --layer above --state floating --flag sticky
    eval $1 view
    toggleHidden off
    ;;
  list) echo "$(nodes)" ;;
  view) toggleHidden off ;;
  hide) toggleHidden on ;;
  toggle) toggleHidden
    ;;
  *) echo "Unknown argument." ;;
esac
