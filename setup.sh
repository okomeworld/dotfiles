#!/bin/bash

DOTPATH=$(cd $(dirname $0)&& pwd)

for dotfilepath in $DOTPATH/.??*
do
	dotfile=$(basename $dotfilepath)

	if grep -qcw $dotfile $DOTPATH/ignore_setup_targets; then
		continue
	fi

	ln -snfv "$dotfilepath" "$HOME/$dotfile"
done
