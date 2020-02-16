#!/bin/sh

### opens dmenu with prompt and options 'NO' and 'YES' where 'NO' comes first (and therefore is chosen when you just hit enter)
### it does nothing if 'NO' gets chosen and executes a given command IN BACKGROUND if 'YES' gets chosen

### Arguments:
### $1 : prompt
### $2 : command to execute if 'YES' was chosen

if [ $(echo -e "NO\nYES" | dmenu -i -p "$1") == 'YES' ]; then
	$2 &
fi
